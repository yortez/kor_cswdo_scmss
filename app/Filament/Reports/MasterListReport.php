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
    // public ?string $subHeading = "All records";







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
                                Text::make("Province of South Cotabato")
                                    ->subtitle()
                                    ->font2Xl()
                                    ->fontBold(),
                                // Text::make("Social Welfare and Development Office")
                                //     ->title()
                                //     ->primary(),
                                Text::make("Social Welfare and Development Office")
                                    ->subtitle()
                                    ->font2Xl()
                                    ->fontBold(),

                                Text::make("City of Koronadal")
                                    ->subtitle()
                                    ->fontXl()
                                    ->fontBold(),

                            ])->alignCenter(),
                        Header\Layout\HeaderColumn::make()
                            ->schema([
                                Image::make($image2Path)
                                    ->width9Xl(),
                            ])->alignLeft(),



                    ]),
            ]);
    }


    public function body(Body $body): Body
    {


        return $body
            ->schema([
                Body\Layout\BodyColumn::make()
                    ->schema([
                        VerticalSpace::make(),

                        Text::make("Master list of registered Senior Citizens in Koronadal City")
                            ->fontSm()
                            ->secondary(),

                        Body\Table::make()
                            ->columns([
                                Body\TextColumn::make("osca_id")
                                    ->label("OSCA ID"),
                                Body\TextColumn::make("last_name")
                                    ->label("Last Name"),
                                Body\TextColumn::make("first_name")
                                    ->label("First Name"),
                                Body\TextColumn::make("middle_name")
                                    ->label("Middle Name"),
                                Body\TextColumn::make("extension")
                                    ->label("Extension"),
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
                                            fn($query, $type) => $query->where('master_lists.type', $type)
                                        )
                                        ->when(
                                            $filters['is_active'] ?? null,
                                            fn($query, $status) => $query->where('master_lists.is_active', $status)
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
                Select::make('type')
                    ->label('Pensioner Type')
                    ->options([
                        'pensioner' => 'Pensioner',
                        'non-pensioner' => 'Non-Pensioner',
                    ])
                    ->placeholder('All'),
                Select::make('is_active')
                    ->label('Status')
                    ->options([
                        1 => 'Active',
                        0 => 'Inactive',
                    ])
                    ->placeholder('All'),
            ]);
    }
}
