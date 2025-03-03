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
                ->rules(['required']),
            ImportColumn::make('birthday')
                ->requiredMapping()
                ->rules(['required']),
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
                ->requiredMapping()
                ->rules(['required']),
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
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('illness')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('disability')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('educational_attainment')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('date_of_registration')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('is_active')
                ->requiredMapping()
                ->rules(['required']),
            ImportColumn::make('type')
                ->requiredMapping()
                ->rules(['required']),

        ];
    }

    public function resolveRecord(): ?MasterList
    {
        // return Book::firstOrNew([
        //     // Update existing records, matching them by `$this->data['column_name']`
        //     'email' => $this->data['email'],
        // ]);

        return new MasterList();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your book import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
