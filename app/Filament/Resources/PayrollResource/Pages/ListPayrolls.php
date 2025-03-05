<?php

namespace App\Filament\Resources\PayrollResource\Pages;

use App\Filament\Resources\PayrollResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListPayrolls extends ListRecords
{
    protected static string $resource = PayrollResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function getTabs(): array
    {
        $baseQuery = PayrollResource::getEloquentQuery();

        return [
            'All' => Tab::make()
                ->badge($baseQuery->count()),
            'New' => Tab::make()
                ->query(fn(Builder $query) => $query->where('status', 'new'))
                ->badge(fn() => $baseQuery->where('status', 'new')->count())
                ->icon('heroicon-o-sparkles'),
            'Pending' => Tab::make()
                ->query(fn(Builder $query) => $query->where('status', 'pending'))
                ->badge(fn() => $baseQuery->where('status', 'pending')->count())
                ->icon('heroicon-o-clock'),
            'Completed' => Tab::make()
                ->query(fn(Builder $query) => $query->where('status', 'completed'))
                ->badge(fn() => $baseQuery->where('status', 'completed')->count())
                ->icon('heroicon-o-check'),
        ];
    }
}
