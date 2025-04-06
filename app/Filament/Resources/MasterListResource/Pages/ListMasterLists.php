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
use App\Models\Purok;
use App\Models\Barangay;
use App\Models\Religion;
use App\Models\City;

class ListMasterLists extends ListRecords
{
    protected static string $resource = MasterListResource::class;
    protected static bool $isLazy = false;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Add Senior Citizen'),
            $this->getImportAction(),
            $this->getExportAction(),
        ];
    }

    protected function getImportAction(): ImportAction
    {
        return ImportAction::make()
            ->importer(MasterListImporter::class)
            ->options([
                'religion' => Religion::first()->id,
                'city_id' => City::first()->id,
                'barangay_id' => Barangay::first()->id,
                'purok_id' => Purok::first()->id,
            ]);
    }

    protected function getExportAction(): ExportAction
    {
        return ExportAction::make()->exporter(MasterListExporter::class);
    }

    public function getTabs(): array
    {
        $baseQuery = MasterListResource::getEloquentQuery();

        return [
            'all' => $this->createTab('All', null, $baseQuery),
            'pensioners' => $this->createTab('Pensioners', 'pensioner', $baseQuery),
            'non_pensioners' => $this->createTab('Non-Pensioners', 'non-pensioner', $baseQuery),
            'inactive' => $this->createInactiveTab($baseQuery),
        ];
    }

    protected function createTab(string $label, ?string $type, Builder $baseQuery): Tab
    {
        $query = function (Builder $query) use ($type) {
            if ($type) {
                return $query->where('type', $type)->where('is_active', true);
            }
            return $query->where('is_active', true);
        };

        $badgeCount = function () use ($baseQuery, $type) {
            $query = $baseQuery->clone();
            if ($type) {
                return $query->where('type', $type)->where('is_active', true)->count();
            }
            return $query->where('is_active', true)->count();
        };

        return Tab::make($label)
            ->query($query)
            ->badge($badgeCount)
            ->icon('heroicon-o-user');
    }

    protected function createInactiveTab(Builder $baseQuery): Tab
    {
        return Tab::make('Inactive')
            ->query(fn(Builder $query) => $query->where('is_active', false))
            ->badge(fn() => $baseQuery->clone()->where('is_active', false)->count())
            ->icon('heroicon-o-exclamation-circle');
    }
}
