<?php

namespace App\Filament\Resources\MasterListResource\Pages;

use App\Filament\Resources\MasterListResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateMasterList extends CreateRecord
{
    protected static string $resource = MasterListResource::class;
    protected static bool $canCreateAnother = false;

    //customize redirect after create
    public function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
