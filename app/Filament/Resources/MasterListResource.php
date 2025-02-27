<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MasterListResource\Pages;
use App\Filament\Resources\MasterListResource\RelationManagers;
use App\Models\MasterList;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Get;
use Illuminate\Validation\Rule;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use App\Models\Purok;
use App\Models\Barangay;
use Filament\Forms\Components\Radio;

class MasterListResource extends Resource
{
    protected static ?string $model = MasterList::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([



                Forms\Components\Group::make()->schema([


                    Forms\Components\Section::make('Personal Information')
                        ->description('')
                        ->schema([


                            Forms\Components\TextInput::make('osca_id')
                                ->unique(ignoreRecord: true)
                                ->numeric()
                                ->columnSpan(2),
                            Forms\Components\Group::make()->schema([
                                Forms\Components\TextInput::make('last_name')
                                    ->required()
                                    ->maxLength(255)
                                    ->rules([
                                        function (Get $get) {
                                            return Rule::unique('master_lists', 'last_name')
                                                ->where('first_name', $get('first_name'))
                                                ->where('middle_name', $get('middle_name'))
                                                ->ignore($get('id'));
                                        }
                                    ])
                                    ->live(onBlur: true),
                                Forms\Components\TextInput::make('first_name')
                                    ->required()
                                    ->maxLength(255)
                                    ->live(onBlur: true),
                                Forms\Components\TextInput::make('middle_name')
                                    ->required()
                                    ->maxLength(255)
                                    ->live(onBlur: true),
                            ])->columns(3)->columnSpanFull(),


                            Forms\Components\TextInput::make('extension')
                                ->maxLength(255),
                            Forms\Components\DatePicker::make('birthday')
                                ->required()
                                ->live(onBlur: true)
                                ->maxDate(now()->subYears(60))
                                ->afterStateUpdated(function ($set, $state) {
                                    $age = Carbon::parse($state)->age;
                                    $set('age', $age);
                                }),
                            Forms\Components\TextInput::make('age')
                                ->disabled()

                                ->dehydrated()
                                ->required(),
                            Forms\Components\Select::make('gender')
                                ->options([
                                    'M' => 'Male',
                                    'F' => 'Female'
                                ])
                                ->required(),
                            Forms\Components\Select::make('religion_id')
                                ->relationship('religion', 'name')
                                ->searchable()
                                ->placeholder('Select Option')
                                ->preload()
                                ->createOptionForm([
                                    Forms\Components\TextInput::make('name')
                                        ->required()
                                        ->maxLength(255),
                                ])

                                ->required(),
                            Forms\Components\Select::make('civil_status')
                                ->options([
                                    'single' => 'Single',
                                    'married' => 'Married',
                                    'devorced' => 'Devorced',
                                    'legally separated' => 'Legally Separated',
                                    'widowed' => 'Widowed'
                                ])
                                ->required(),

                            Forms\Components\Select::make('educational_attainment')
                                ->options([
                                    'elementary graduate' => 'Elementary Graduate',
                                    'high school graduate' => 'High School Graduate',
                                    'bachelor degree' => 'Bachelor Degree',
                                    'master degree' => 'Master Degree',
                                    'doctorate degree' => 'Doctorate Degree',
                                ])
                                ->required(),
                            Forms\Components\TextInput::make('birth_place')
                                ->required()
                                ->maxLength(255)
                                ->columnSpan(2),
                        ])->columns(3),
                    Forms\Components\Section::make('Other Information')
                        ->description('')
                        ->schema([

                            Forms\Components\TextInput::make('gsis_id')
                                ->maxLength(255),
                            Forms\Components\TextInput::make('philhealth_id')
                                ->maxLength(255),
                            Forms\Components\TextInput::make('illness')
                                ->maxLength(255),
                            Forms\Components\TextInput::make('disability')
                                ->maxLength(255),


                        ])->columns(2),
                ])->columnSpan(2),
                Forms\Components\Group::make()->schema([
                    Forms\Components\Section::make('Address')
                        ->description('')
                        ->schema([
                            Forms\Components\Select::make('city_id')
                                ->relationship('city', 'name')
                                ->default(1)
                                ->searchable()
                                ->preload()
                                ->createOptionForm([
                                    Forms\Components\TextInput::make('name')
                                        ->required()
                                        ->maxLength(255),
                                ])

                                ->required(),
                            Forms\Components\Select::make('barangay_id')
                                ->relationship('barangay', 'name')
                                ->searchable()
                                ->preload()
                                ->live()
                                ->createOptionForm([
                                    Forms\Components\TextInput::make('name')
                                        ->required()
                                        ->maxLength(255),
                                ])
                                ->required(),
                            Forms\Components\Select::make('purok_id')
                                ->options(fn(Get $get): Collection => Purok::query()
                                    ->where('barangay_id', $get('barangay_id'))
                                    ->pluck('name', 'id'))
                                ->createOptionForm([
                                    Forms\Components\Select::make('barangay_id')
                                        ->options(fn(Get $get): Collection => Barangay::query()
                                            ->pluck('name', 'id'))
                                        ->default(fn(Get $get) => $get('../../barangay_id'))
                                        ->required(),
                                    Forms\Components\TextInput::make('name')
                                        ->required()
                                        ->maxLength(255),
                                ])
                                ->createOptionUsing(function (array $data) {
                                    return Purok::create($data);
                                })
                                ->preload()
                                ->required(),

                        ]),
                    Forms\Components\Section::make('Status')
                        ->description('')
                        ->schema([

                            Radio::make('type')
                                ->options([
                                    'pensioner' => 'Pensioner',
                                    'non-pensioner' => 'Non-Pensioner',
                                ]),
                            Forms\Components\DatePicker::make('date_of_registration')
                                ->date()
                                ->required()
                                ->maxDate(now()),
                            Forms\Components\Toggle::make('is_active')
                                ->label(fn($state) => $state ? 'Active' : 'Inactive')
                                ->default(true)
                                ->required()
                                ->reactive()
                                ->afterStateUpdated(function (callable $set, $state) {
                                    $set('registry_number_hidden', $state);
                                }),
                            Forms\Components\TextInput::make('registry_number')
                                ->hidden(fn(Get $get) => $get('is_active'))
                                ->required(fn(Get $get) => !$get('is_active')),
                            Forms\Components\TextInput::make('remarks')
                                ->hidden(fn(Get $get) => $get('is_active'))
                                ->required(fn(Get $get) => !$get('is_active')),
                        ]),



                ])->columnSpan(1),

            ])->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                Tables\Columns\TextColumn::make('osca_id')
                    ->sortable(),
                Tables\Columns\TextColumn::make('last_name')
                    ->label('Name')
                    ->formatStateUsing(fn(MasterList $record): string =>
                    "{$record->last_name}, {$record->first_name} {$record->middle_name} {$record->extension}")
                    ->sortable(['last_name', 'first_name', 'middle_name'])
                    ->searchable(['last_name', 'first_name', 'middle_name', 'extension']),

                Tables\Columns\TextColumn::make('age')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('birthday')
                    ->date()
                    ->sortable(),

                Tables\Columns\TextColumn::make('gender')
                    ->searchable(),
                Tables\Columns\TextColumn::make('civil_status')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('religion')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('birth_place')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('purok.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('barangay.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('city.name')
                    ->toggleable(isToggledHiddenByDefault: true)

                    ->numeric()
                    ->sortable(),


                Tables\Columns\TextColumn::make('gsis_id')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('philhealth_id')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('illness')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('disability')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('educational_attainment')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\TextColumn::make('is_active')
                    ->label('Status')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        '1' => 'primary',
                        '0' => 'danger'
                    })
                    ->formatStateUsing(fn(string $state): string => match ($state) {
                        '1' => 'Active',
                        '0' => 'Deceased',
                    }),


                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make('edit'),
                    Tables\Actions\ViewAction::make('view'),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }


    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMasterLists::route('/'),
            'create' => Pages\CreateMasterList::route('/create'),
            'edit' => Pages\EditMasterList::route('/{record}/edit'),
        ];
    }
}
