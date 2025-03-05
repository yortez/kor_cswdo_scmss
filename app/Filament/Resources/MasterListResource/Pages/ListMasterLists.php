<?php

namespace App\Filament\Resources\MasterListResource\Pages;

use App\Filament\Resources\MasterListResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use App\Filament\Imports\MasterListImporter;
use App\Filament\Exports\MasterListExporter;
use Filament\Tables\Actions\ExportAction;
use Filament\Facades\Filament;
use Filament\Tables\Actions\ImportAction;

class ListMasterLists extends ListRecords
{
    protected static string $resource = MasterListResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Add Senior Citizen'),
            ImportAction::make()->importer(MasterListImporter::class)
                ->options([
                    'religion_id' => Filament::getReligion()->id,
                    'city_id' => Filament::getCity()->id,
                    'barangay_id' => Filament::getBarangay()->id,
                    'purok_id' => Filament::getPurok()->id,
                ]),
            ExportAction::make()->exporter(MasterListExporter::class),

        ];
    }
    public function getTabs(): array
    {
        return [
            null => Tab::make('All'),
            'Pensioner' => Tab::make()->query(fn($query) => $query->where('type', 'pensioner')->where('is_active', true)),
            'Non-Pensioner' => Tab::make()->query(fn($query) => $query->where('type', 'non-pensioner')->where('is_active', true)),
            'Inactive' => Tab::make()->query(fn($query) => $query->where('is_active', false)),

        ];
    }
}
