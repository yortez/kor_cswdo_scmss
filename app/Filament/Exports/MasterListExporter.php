<?php

namespace App\Filament\Exports;

use App\Models\MasterList;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class MasterListExporter extends Exporter
{
    protected static ?string $model = MasterList::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('id')
                ->label('ID'),
            ExportColumn::make('osca_id'),
            ExportColumn::make('last_name'),
            ExportColumn::make('first_name'),
            ExportColumn::make('middle_name'),
            ExportColumn::make('extension'),
            ExportColumn::make('birthday'),
            ExportColumn::make('age'),
            ExportColumn::make('gender'),
            ExportColumn::make('civil_status'),
            ExportColumn::make('religion_id'),
            ExportColumn::make('birth_place'),
            ExportColumn::make('city.name'),
            ExportColumn::make('barangay.name'),
            ExportColumn::make('purok.name'),
            ExportColumn::make('gsis_id'),
            ExportColumn::make('philhealth_id'),
            ExportColumn::make('illness'),
            ExportColumn::make('disability'),
            ExportColumn::make('educational_attainment'),
            ExportColumn::make('date_of_registration'),
            ExportColumn::make('is_active'),
            ExportColumn::make('registry_number'),
            ExportColumn::make('date_of_death'),
            ExportColumn::make('remarks'),
            ExportColumn::make('created_at'),
            ExportColumn::make('updated_at'),
            ExportColumn::make('type'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your master list export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
