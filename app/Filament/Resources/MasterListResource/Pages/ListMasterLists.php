<?php

namespace App\Filament\Resources\MasterListResource\Pages;

use App\Filament\Resources\MasterListResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Imports\MasterListImporter;
use App\Filament\Exports\MasterListExporter;
use Filament\Actions\ImportAction;
use Filament\Actions\ExportAction;
use Filament\Facades\Filament;
use App\Models\Purok;
use App\Models\Barangay;
use App\Models\Religion;
use App\Models\City;

class ListMasterLists extends ListRecords
{
    protected static string $resource = MasterListResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Add Senior Citizen'),
            ImportAction::make()
                ->importer(MasterListImporter::class)
                ->options([
                    'religion' => Religion::first()->id,
                    'city_id' => City::first()->id,
                    'barangay_id' => Barangay::first()->id,
                    'purok_id' => Purok::first()->id,




                ]),
            ExportAction::make()->exporter(MasterListExporter::class),

        ];
    }
    public function getTabs(): array
    {
        $baseQuery = MasterListResource::getEloquentQuery();

        return [
            'All' => Tab::make()
                ->badge($baseQuery->count()),
            'Pensioners' => Tab::make()
                ->query(fn(Builder $query) => $query->where('type', 'pensioner')->where('is_active', true))
                ->badge(fn() => $baseQuery->where('type', 'pensioner')->where('is_active', true)->count())
                ->icon('heroicon-o-user'),
            'Non-Pensioners' => Tab::make()
                ->query(fn(Builder $query) => $query->where('type', 'non-pensioner')->where('is_active', true))
                ->badge(fn() => $baseQuery->where('type', 'non-pensioner')->where('is_active', true)->count())
                ->icon('heroicon-o-user'),
            'Inactive' => Tab::make()
                ->query(fn(Builder $query) => $query->where('is_active', false))
                ->badge(fn() => $baseQuery->where('is_active', false)->count())
                ->icon('heroicon-o-exclamation-circle'),
        ];
    }
}
