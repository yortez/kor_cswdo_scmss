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
                ->requiredMapping(),
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
            ImportColumn::make('religion')
                ->relationship(),
            ImportColumn::make('birth_place')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('city_id')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('barangay_id')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('purok_id')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('philhealth_id')
                ->requiredMapping(),
            ImportColumn::make('illness')
                ->requiredMapping(),
            ImportColumn::make('disability')
                ->requiredMapping(),
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
        $religionId = $this->options['religion_id'];
        $cityId = $this->options['city_id'];
        $barangayId = $this->options['barangay_id'];
        $purokId = $this->options['purok_id'];

        return MasterList::firstOrNew([
            'osca_id' => $this->data['osca_id'],
            'religion_id' => $religionId,
            'city_id' => $cityId,
            'barangay_id' => $barangayId,
            'purok_id' => $purokId,
            'last_name' => $this->data['last_name'],
            'first_name' => $this->data['first_name'],
            'middle_name' => $this->data['middle_name'],
            'extension' => $this->data['extension'],
            'birthday' => $this->data['birthday'],
            'gender' => $this->data['gender'],
            'civil_status' => $this->data['civil_status'],
            'birth_place' => $this->data['birth_place'],
            'gsis_id' => $this->data['gsis_id'],
            'philhealth_id' => $this->data['philhealth_id'],
            'illness' => $this->data['illness'],
            'disability' => $this->data['disability'],
            'educational_attainment' => $this->data['educational_attainment'],
            'date_of_registration' => $this->data['date_of_registration'],
            'is_active' => $this->data['is_active'],
            'type' => $this->data['type'],
        ]);
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
