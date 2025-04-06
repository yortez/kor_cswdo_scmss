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

class MasterListReport extends Report
{
    public ?string $heading = "Report";

    public function header(Header $header): Header
    {
        $image1Path = asset('koronadal-logo.png');
        $image2Path = asset('dswd-logo.jpg');
        $selectedBarangayId = $this->filterForm->getState()['barangay_id'] ?? null;
        $barangayName = $selectedBarangayId
            ? \App\Models\Barangay::find($selectedBarangayId)->name
            : '';
        $selectedType = $this->filterForm->getState()['type'] ?? null;


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

                                Text::make("Master List")
                                    ->subtitle()
                                    ->font2Xl()
                                    ->fontBold(),
                                VerticalSpace::make(),


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

        $selectedBarangayId = $this->filterForm->getState()['barangay_id'] ?? null;
        $barangayName = $selectedBarangayId
            ? \App\Models\Barangay::find($selectedBarangayId)->name
            : ' ';
        $selectedType = $this->filterForm->getState()['type'] ?? 'Pensioners and Non-Pensioners';


        return $body
            ->schema([
                Body\Layout\BodyColumn::make()
                    ->schema([
                        VerticalSpace::make(),
                        Text::make("Registered Senior Citizens in " . $barangayName . " Koronadal City - " . $selectedType)
                            ->fontSm()
                            ->secondary(),

                        Body\Table::make()
                            ->columns([
                                Body\TextColumn::make("osca_id")
                                    ->label("Osca ID"),
                                Body\TextColumn::make("last_name")
                                    ->label("Last Name")
                                    ->weight(10),
                                Body\TextColumn::make("first_name")
                                    ->label("First Name"),
                                Body\TextColumn::make("middle_name")
                                    ->label("Middle Name"),
                                Body\TextColumn::make("extension")
                                    ->label("Ext"),

                                Body\TextColumn::make("age")
                                    ->label("Age"),
                                Body\TextColumn::make("gender")
                                    ->label("Gender"),
                                Body\TextColumn::make("barangay_name")
                                    ->label("Barangay"),
                                Body\TextColumn::make('purok_name')
                                    ->label('Purok'),
                            ])
                            ->data(
                                function (?array $filters) {
                                    return MasterList::query()
                                        ->join('barangays', 'master_lists.barangay_id', '=', 'barangays.id')
                                        ->join('puroks', 'master_lists.purok_id', '=', 'puroks.id')
                                        ->when(
                                            $filters['type'] ?? null,
                                            fn($query, $type) => $query->where('master_lists.type', $type),

                                        )
                                        ->when(
                                            isset($filters['is_active']),
                                            fn($query) => $query->where('master_lists.is_active', $filters['is_active'])
                                        )
                                        ->when(
                                            $filters['barangay_id'] ?? null,
                                            fn($query, $barangayId) => $query->where('master_lists.barangay_id', $barangayId)
                                        )
                                        ->select(
                                            'master_lists.osca_id',
                                            'master_lists.last_name',
                                            'master_lists.first_name',
                                            'master_lists.middle_name',
                                            'master_lists.extension',
                                            'master_lists.age',
                                            'master_lists.gender',
                                            'barangays.name as barangay_name',
                                            'puroks.name as purok_name',
                                            'master_lists.type',
                                            'master_lists.is_active'
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
                                Text::make("Generated on: " . now()->format('Y-m-d H:i:s')),
                            ])
                            ->alignRight(),
                    ]),
            ]);
    }

    public function filterForm(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('is_active')
                    ->label('Status')
                    ->options([
                        1 => 'Active',
                        0 => 'Inactive'
                    ])
                    ->placeholder('All')
                    ->afterStateUpdated(function ($state, callable $set) {
                        $selectedStatus = $state;
                        // You can now use $selectedBarangayId as needed
                        // For example, you might want to set it to another component or use it in a query
                    }),
                Select::make('type')
                    ->label('Pensioner Type')
                    ->options([
                        'pensioner' => 'Pensioner',
                        'non-pensioner' => 'Non-Pensioner',
                    ])
                    ->placeholder('All')
                    ->afterStateUpdated(function ($state, callable $set) {
                        $selectedType = $state;
                        // You can now use $selectedBarangayId as needed
                        // For example, you might want to set it to another component or use it in a query
                    }),
                Select::make('barangay_id')
                    ->label('Barangay')
                    ->options(function () {
                        return \App\Models\Barangay::pluck('name', 'id');
                    })
                    ->placeholder('All Barangays')
                    ->afterStateUpdated(function ($state, callable $set) {
                        $selectedBarangayId = $state;
                        // You can now use $selectedBarangayId as needed
                        // For example, you might want to set it to another component or use it in a query
                    })



            ]);
    }
}
