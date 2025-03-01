<?php

namespace App\Filament\Widgets;

use App\Models\MasterList;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class SeniorCitizenPerBarangayChart extends ChartWidget
{
    protected static ?string $heading = 'Senior Citizens by Barangay';
    protected static ?int $sort = 1;
    protected int | string | array $columnSpan = 'full';


    protected function getData(): array
    {
        $data = MasterList::select('barangay_id', DB::raw('COUNT(*) as count'))
            ->groupBy('barangay_id')
            ->orderBy('count', 'desc')
            // ->limit(10)  // Limit to top 10 barangays for better readability
            ->get();

        return [
            'datasets' => [
                [
                    'label' => 'Number of Senior Citizens',
                    'data' => $data->pluck('count')->toArray(),
                    'backgroundColor' => ['#36A2EB', '#FF6384', '#4BC0C0', '#FF9F40'],

                ],
            ],
            'labels' => $data->pluck('barangay.name')->toArray(),
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }

    protected function getRandomColors(int $count): array
    {
        $colors = [];
        for ($i = 0; $i < $count; $i++) {
            $colors[] = '#' . substr(md5(mt_rand()), 0, 6);
        }
        return $colors;
    }
}
