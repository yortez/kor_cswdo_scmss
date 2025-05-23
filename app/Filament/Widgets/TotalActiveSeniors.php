<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\MasterList;
use App\Models\Payroll;
use App\Models\GrantedBeneficiary;


class TotalActiveSeniors extends BaseWidget
{
    protected static ?int $sort = 0;

    protected function getStats(): array
    {
        return [
            Stat::make('Total Senior Citizens in Koronadal City', MasterList::query()->count())
                ->descriptionIcon('heroicon-m-user-group')
                ->color('success'),
            Stat::make('Pensioner', MasterList::query()->where('type', 'pensioner')->count())

                ->color('danger'),
            Stat::make('Non-Pensioner', MasterList::query()->where('type', 'non-pensioner')->count())

                ->color('success'),


        ];
    }
}
