<?php

namespace App\Filament\Resources\MasterListResource\Pages;

use App\Filament\Resources\MasterListResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;


class ListMasterLists extends ListRecords
{
    protected static string $resource = MasterListResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Add Senior Citizen'),


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
