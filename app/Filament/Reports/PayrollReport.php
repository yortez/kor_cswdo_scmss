<?php

namespace App\Filament\Reports;

use App\Models\MasterList;
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
    protected static ?string $navigaLabel = '';
    public ?string $heading = "Report";


    public function header(Header $header): Header
    {
        $image1Path = asset('koronadal-logo.png');
        $image2Path = asset('dswd-logo.jpg');
        $selectedBarangayId = $this->filterForm->getState()['barangay_id'] ?? null;
        $barangayName = $selectedBarangayId
            ? 'Barangay ' . \App\Models\Barangay::find($selectedBarangayId)->name
            : '';
        $selectedPayrollId = $this->filterForm->getState()['payroll'] ?? null;
        $payrollName = $selectedPayrollId
            ? \App\Models\Benefit::find($selectedPayrollId)->name . ' Assistance Payroll'
            : '';

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

                                Text::make($payrollName)
                                    ->subtitle()
                                    ->font2Xl(),
                                Text::make($barangayName)
                                    ->subtitle()
                                    ->font2Xl(),


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

        $selectedPayrollId = $this->filterForm->getState()['payroll'] ?? null;
        $payrollName = $selectedPayrollId
            ? \App\Models\Benefit::find($selectedPayrollId)->name . ' Assistance Beneficiaries'
            : '';
        $payrollAmount = $selectedPayrollId
            ? \App\Models\Payroll::find($selectedPayrollId)->amount
            : '';

        return $body
            ->schema([
                Body\Layout\BodyColumn::make()
                    ->schema([
                        VerticalSpace::make(),
                        Text::make("For the payment of " . $payrollName)
                            ->fontSm()
                            ->secondary(),

                        Body\Table::make()
                            ->columns([
                                Body\TextColumn::make("osca_id")
                                    ->label("Osca ID"),
                                Body\TextColumn::make("full_name")
                                    ->label("Name"),
                                Body\TextColumn::make("birthday")
                                    ->label("Birthday")
                                    ->date(),
                                Body\TextColumn::make("age")
                                    ->label("Age"),
                                Body\TextColumn::make("gender")
                                    ->label("Gender"),
                                Body\TextColumn::make("barangay_name")
                                    ->label("Barangay"),
                                Body\TextColumn::make('purok_name')
                                    ->label('Purok'),
                                Body\TextColumn::make('amount')
                                    ->label('Amount')
                                    ->money('PHP'),
                                Body\TextColumn::make('signature')
                                    ->label('Signature')

                            ])
                            ->data(
                                function (?array $filters) use ($payrollAmount) {
                                    return MasterList::query()->with('payrolls')
                                        ->join('barangays', 'master_lists.barangay_id', '=', 'barangays.id')
                                        ->join('puroks', 'master_lists.purok_id', '=', 'puroks.id')
                                        ->when(
                                            $filters['barangay_id'] ?? null,
                                            fn($query, $barangayId) => $query->where('master_lists.barangay_id', $barangayId)
                                        )
                                        ->when(
                                            $filters['payroll'] ?? null,
                                            fn($query, $payrollId) => $query->whereHas('payrolls', function ($q) use ($payrollId) {
                                                $q->where('payrolls.id', $payrollId);
                                            })
                                        )
                                        ->select(
                                            'master_lists.osca_id',
                                            'master_lists.full_name',
                                            'master_lists.last_name',
                                            'master_lists.first_name',
                                            'master_lists.middle_name',
                                            'master_lists.extension',
                                            'master_lists.birthday',
                                            'master_lists.age',
                                            'master_lists.gender',
                                            'barangays.name as barangay_name',
                                            'puroks.name as purok_name',
                                            'master_lists.signature',
                                            \DB::raw("'$payrollAmount' as amount")
                                        )
                                        ->get();
                                }
                            ),
                    ]),
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
                                Text::make("Generated on: " . now()->format('F j, Y H:i:s')),
                            ])
                            ->alignRight(),
                    ]),
            ]);
    }

    public function filterForm(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('payroll')
                    ->label('Payroll')
                    ->options(fn() => \App\Models\Payroll::join('benefits', 'payrolls.benefit_id', '=', 'benefits.id')
                        ->where('status', 'new')
                        ->pluck('benefits.name', 'payrolls.id')) // Join with benefits table and pluck benefit name
                    ->placeholder('All Payrolls'),
                Select::make('barangay_id')
                    ->label('Barangay')
                    ->options(function () {
                        return \App\Models\Barangay::pluck('name', 'id');
                    })
                    ->placeholder('All Barangays')
            ]);
    }
}
