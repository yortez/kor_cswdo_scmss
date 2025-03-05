<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PayrollResource\Pages;
use App\Filament\Resources\PayrollResource\RelationManagers\SeniorsRelationManager;
use App\Models\Payroll;
use Filament\Forms;
use Filament\Forms\Components\Builder;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Infolists;
use Filament\Infolists\Infolist;



class PayrollResource extends Resource
{
    protected static ?string $model = Payroll::class;

    protected static ?string $navigationIcon = 'heroicon-o-banknotes';
    protected static ?int $navigationSort = 3;
    public static function getNavigationBadge(): ?string
    {
        $count = static::getModel()::where('status', 'new')->count();
        return $count > 0 ? (string)$count : null;
    }
    protected static ?string $navigationBadgeTooltip = 'New payroll';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                    ->schema([
                        Forms\Components\Select::make('benefit_id')
                            ->relationship('benefit', 'name')
                            ->label('Benefit')
                            ->required()
                            ->searchable()
                            ->preload()
                            ->getOptionLabelUsing(fn($value): ?string => \App\Models\Benefit::find($value)?->name)
                            ->disabledOn('edit')
                            ->reactive()
                            ->afterStateUpdated(function ($set, $state) {
                                $benefit = \App\Models\Benefit::find($state);
                                if ($benefit) {
                                    $set('description', $benefit->description);
                                    $set('amount', $benefit->amount);
                                }
                            }),
                        Forms\Components\Textarea::make('benefit_description')
                            ->label('Description')
                            ->disabled()
                            ->dehydrated(false)
                            ->rows(5)
                            ->afterStateHydrated(function ($component, $state, $record) {
                                // Load the description when editing an existing record
                                if ($record && $record->benefit) {
                                    $component->state($record->benefit->description);
                                }
                            })
                            ->hiddenOn('create'),

                    ])->columnSpan(2),
                Forms\Components\Section::make()->schema([
                    Forms\Components\TextInput::make('amount')
                        ->numeric()
                        ->prefix('₱')
                        ->default(null)
                        ->required(),

                    Forms\Components\Select::make('status')
                        ->options([
                            'new' => 'New',
                            'pending' => 'Pending',
                            'completed' => 'Completed',
                        ])
                        ->default('new')
                        ->required(),
                    Forms\Components\Textarea::make('note')
                        ->maxLength(255)
                        ->default(null),
                ])->columnSpan(1),

            ])->columns(3);
    }


    public static function getRelations(): array
    {
        return [
            SeniorsRelationManager::class,
        ];
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Date')
                    ->dateTime('F j, Y'),
                Tables\Columns\TextColumn::make('benefit.name')
                    ->label('Benefit'),
                Tables\Columns\TextColumn::make('benefit.amount')
                    ->label('Amount')
                    ->money('PHP'),
                Tables\Columns\TextColumn::make('seniors_count')
                    ->label('Attached')
                    ->counts('seniors'),
                Tables\Columns\TextColumn::make('claimed_seniors_count')
                    ->label('Claimed'),


                Tables\Columns\TextColumn::make('note')
                    ->searchable(),
                Tables\Columns\TextColumn::make('status')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'new' => 'primary',
                        'pending' => 'warning',
                        'completed' => 'success',
                    })
                    ->searchable(),
                Tables\Columns\TextColumn::make('seniors.full_name')
                    ->label('Senior Citizens')
                    ->listWithLineBreaks()
                    ->toggleable(isToggledHiddenByDefault: true),


            ])
            ->filters([])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make('edit'),
                    Tables\Actions\DeleteAction::make('delete'),

                ])
            ])
            ->bulkActions([]);
    }




    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPayrolls::route('/'),
            'create' => Pages\CreatePayroll::route('/create'),
            'edit' => Pages\EditPayroll::route('/{record}/edit'),

        ];
    }
}
