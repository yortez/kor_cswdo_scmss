<?php

namespace App\Filament\Resources\MasterListResource\Pages;

use App\Filament\Resources\MasterListResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMasterLists extends ListRecords
{
    protected static string $resource = MasterListResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
