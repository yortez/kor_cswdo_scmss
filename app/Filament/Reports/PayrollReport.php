<?php

namespace App\Filament\Reports;

use App\Models\Benefit;
use App\Models\MasterList;
use App\Models\Payroll;
use EightyNine\Reports\Components\Image;
use EightyNine\Reports\Report;
use EightyNine\Reports\Components\Body;
use EightyNine\Reports\Components\Footer;
use EightyNine\Reports\Components\Header;
use EightyNine\Reports\Components\Text;
use EightyNine\Reports\Components\VerticalSpace;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;

class PayrollReport extends Report
{
    public ?string $heading = "Report";


    public function header(Header $header): Header
    {

        $image1Path = asset('koronadal-logo.png');
        $image2Path = asset('dswd-logo.jpg');

        return $header
            ->schema([
                Header\Layout\HeaderRow::make()
                    ->schema([
                        Header\Layout\HeaderColumn::make()
                            ->schema([
                                Image::make($image1Path)
                                    ->width3Xl(),
                            ])->alignLeft(),
                        Header\Layout\HeaderColumn::make()
                            ->schema([
                                Text::make("PROVINCE OF SOUTH COTABATO")
                                    ->subtitle()
                                    ->fontLg()
                                    ->fontBold(),

                                Text::make("SOCIAL WELFARE AND DEVELOPMENT OFFICE")
                                    ->subtitle()
                                    ->fontLg()
                                    ->fontBold(),

                                Text::make("City of Koronadal")
                                    ->subtitle()
                                    ->fontLg()
                                    ->fontBold(),
                                VerticalSpace::make(),
                                Text::make("Payroll")
                                    ->subtitle()
                                    ->font2Xl()
                                    ->fontBold(),
                                VerticalSpace::make(),


                            ])->alignCenter(),
                        Header\Layout\HeaderColumn::make()
                            ->schema([
                                Image::make($image2Path)
                                    ->width4Xl(),
                            ])->alignRight(),



                    ]),
            ]);
    }


    public function body(Body $body): Body
    {

        $selectedQuarter = $this->filterForm->getState()['quarter'] ?? null;


        return $body
            ->schema([
                Body\Layout\BodyColumn::make()
                    ->schema([
                        VerticalSpace::make(),
                        Text::make("Payroll Report " . $selectedQuarter)
                            ->fontSm()
                            ->secondary(),
                        Body\Table::make()
                            ->columns([
                                Body\TextColumn::make("created_at")
                                    ->label("Date")
                                    ->date('F d Y'),
                                Body\TextColumn::make("benefit")
                                    ->label("Benefit Type"),
                                Body\TextColumn::make("note")
                                    ->label("Note"),
                                Body\TextColumn::make("status")
                                    ->label("Status"),

                            ])
                            ->data(
                                function (?array $filters) {
                                    return Payroll::query()->with('seniors')
                                        ->join('benefits', 'payrolls.benefit_id', '=', 'benefits.id')


                                        ->when(
                                            $filters['benefit_id'] ?? null,
                                            fn($query, $payrollId) => $query->where('payrolls.benefit_id', $payrollId)
                                        )
                                        ->when($filters['quarter'] ?? null, function ($query, $quarter) {
                                            return $query->where(function ($q) use ($quarter) {
                                                switch ($quarter) {
                                                    case 'First Quarter':
                                                        return $q->whereMonth('payrolls.created_at', '>=', 1)
                                                            ->whereMonth('payrolls.created_at', '<=', 3);
                                                    case 'Second Quarter':
                                                        return $q->whereMonth('payrolls.created_at', '>=', 4)
                                                            ->whereMonth('payrolls.created_at', '<=', 6);
                                                    case 'Third Quarter':
                                                        return $q->whereMonth('payrolls.created_at', '>=', 7)
                                                            ->whereMonth('payrolls.created_at', '<=', 9);
                                                    case 'Forth Quarter':
                                                        return $q->whereMonth('payrolls.created_at', '>=', 10)
                                                            ->whereMonth('payrolls.created_at', '<=', 12);
                                                }
                                            });
                                        })
                                        ->select(
                                            'payrolls.created_at',
                                            'benefits.name as benefit',
                                            'payrolls.note',
                                            'payrolls.status',


                                        )
                                        ->get();
                                }
                            ),
                    ])
            ]);
    }

    public function footer(Footer $footer): Footer
    {
        return $footer
            ->schema([
                Footer\Layout\FooterRow::make()
                    ->schema([
                        Footer\Layout\FooterColumn::make()
                            ->schema([]),
                        Footer\Layout\FooterColumn::make()
                            ->schema([
                                Text::make("Generated on: " . now()->format('Y-m-d H:i:s')),
                            ])
                            ->alignRight(),
                    ]),
            ]);
    }

    public function filterForm(Form $form): Form
    {
        $benefits = \App\Models\Benefit::pluck('name', 'id');

        return $form
            ->schema([
                Select::make('benefit_id')
                    ->label('Benefit Type')
                    ->options($benefits)
                    ->placeholder('Benefit type')
                    ->searchable(),

                Select::make('quarter')
                    ->label('Quarter')
                    ->options([
                        'First Quarter' => '1st Quarter (Jan-Mar)',
                        'Second Quarter' => '2nd Quarter (Apr-Jun)',
                        'Third Quarter' => '3rd Quarter (Jul-Sep)',
                        'Forth Quarter' => '4th Quarter (Oct-Dec)',
                    ])
                    ->placeholder('Select a quarter')
                    ->afterStateUpdated(function ($state, callable $set) {
                        $selectedQuarter = $state;
                        // You can now use $selectedBarangayId as needed
                        // For example, you might want to set it to another component or use it in a query
                    })
            ]);
    }
}
