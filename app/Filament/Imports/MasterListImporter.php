<?php

namespace App\Filament\Imports;

use App\Models\MasterList;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class MasterListImporter extends Importer
{
    protected static ?string $model = MasterList::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('osca_id')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('last_name')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('first_name')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('middle_name')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('extension')
                ->requiredMapping()
                ->ignoreBlankState(),
            ImportColumn::make('birthday')
                ->requiredMapping()
                ->rules(['required', 'date']),
            ImportColumn::make('age')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('gender')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('civil_status')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('religion_id')
                ->relationship('religion', 'name'),
            ImportColumn::make('birth_place')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('city_id')
                ->relationship('city', 'name'),

            ImportColumn::make('barangay_id')
                ->relationship('barangay', 'name'),

            ImportColumn::make('purok_id')
                ->relationship('purok', 'name'),
            ImportColumn::make('gsis_id')
                ->requiredMapping()
                ->ignoreBlankState(),
            ImportColumn::make('philhealth_id')
                ->requiredMapping()
                ->ignoreBlankState(),
            ImportColumn::make('illness')
                ->requiredMapping()
                ->ignoreBlankState(),
            ImportColumn::make('disability')
                ->requiredMapping()
                ->ignoreBlankState(),
            ImportColumn::make('educational_attainment')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('date_of_registration')
                ->requiredMapping()
                ->rules(['required', 'date']),
            ImportColumn::make('is_active')
                ->boolean()
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('type')
                ->requiredMapping()
                ->rules(['required']),

        ];
    }

    public function resolveRecord(): ?MasterList
    {
        // $religionId = $this->options['religion_id'];
        // $cityId = $this->options['city_id'];
        // $barangayId = $this->options['barangay_id'];
        // $purokId = $this->options['purok_id'];

        // return MasterList::firstOrNew([
        //     'osca_id' => $this->data['osca_id'],
        //     'religion_id' => $religionId,
        //     'city_id' => $cityId,
        //     'barangay_id' => $barangayId,
        //     'purok_id' => $purokId,
        //     'last_name' => $this->data['last_name'],
        //     'first_name' => $this->data['first_name'],
        //     'middle_name' => $this->data['middle_name'],
        //     'birthday' => $this->data['birthday'],
        //     'age' => $this->data['age'],
        //     'gender' => $this->data['gender'],
        //     'civil_status' => $this->data['civil_status'],
        //     'birth_place' => $this->data['birth_place'],
        //     "gsis_id" => $this->data['gsis_id'] ?? null,
        //     'philhealth_id' => $this->data['philhealth_id'] ?? null,
        //     'illness' => $this->data['illness'] ?? null,
        //     'disability' => $this->data['disability'] ?? null,
        //     'extension' => $this->data['extension'] ?? null,
        //     'educational_attainment' => $this->data['educational_attainment'],
        //     'date_of_registration' => $this->data['date_of_registration'],
        //     'is_active' => $this->data['is_active'],
        //     'type' => $this->data['type'],
        // ]);
        return new MasterList();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your master list import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
