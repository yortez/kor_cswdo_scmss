<?php

namespace App\Filament\Resources\MasterListResource\Pages;

use App\Filament\Resources\MasterListResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMasterList extends EditRecord
{
    protected static string $resource = MasterListResource::class;

    protected function getHeaderActions(): array
    {
        return [
        ];
    }

    //customize redirect after create
    public function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
