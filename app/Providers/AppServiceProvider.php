<?php

namespace App\Providers;

use App\Models\User;
use Filament\Forms\Components\DatePicker;
use Filament\Support\Facades\FilamentView;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Actions\CreateAction;
use Filament\Actions\Action;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
        parent::register();
        FilamentView::registerRenderHook('panels::body.end', fn(): string => Blade::render("@vite('resources/js/app.js')"));
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
        Gate::define('viewApiDocs', function (User $user) {
            return true;
        });
        // Gate::policy()
        Event::listen(function (\SocialiteProviders\Manager\SocialiteWasCalled $event) {
            $event->extendSocialite('discord', \SocialiteProviders\Google\Provider::class);
        });

        TextInput::configureUsing(function (TextInput $textInput) {
            $textInput->inlineLabel();
        });


        Select::configureUsing(function (Select $select) {
            $select->inlineLabel();
        });

        DatePicker::configureUsing(function (DatePicker $datePicker) {
            $datePicker->inlineLabel();
        });
        CreateAction::configureUsing(function (CreateAction $action) {
            $action->icon('heroicon-o-plus');
        });
        Action::configureUsing(function (Action $action) {
            if ($action->getName() === 'save') {
                $action->icon('heroicon-o-check');
            }
            if ($action->getName() === 'cancel') {
                $action->icon('heroicon-o-x-mark');
            }
            if ($action->getName() === 'create') {
                $action->icon('heroicon-o-plus');
            }
            if ($action->getName() === 'close') {
                $action->icon('heroicon-o-x-mark');
            }
        });
    }
}
