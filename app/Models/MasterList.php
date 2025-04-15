<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;

class MasterList extends Model
{
    public function city(): BelongsTo
    {
        return $this->belongsTo(City::class);
    }
    public function barangay(): BelongsTo
    {
        return $this->belongsTo(Barangay::class);
    }
    public function purok(): BelongsTo
    {
        return $this->belongsTo(Purok::class);
    }

    public function religion()
    {
        return $this->belongsTo(Religion::class);
    }

    public function payrolls()
    {
        return $this->belongsToMany(Payroll::class, 'payroll_senior_citizen')->withPivot('status');
    }
    // add fillable
    protected $fillable = [
        'osca_id',
        'last_name',
        'first_name',
        'middle_name',
        'extension',
        'birthday',
        'age',
        'gender',
        'civil_status',
        'religion_id',
        'birth_place',
        'city_id',
        'barangay_id',
        'purok_id',
        'gsis_id',
        'philhealth_id',
        'illness',
        'disability',
        'educational_attainment',
        'date_of_registration',
        'is_active',
        'registry_number',
        'date_of_death',
        'remarks',

    ];
    // add guaded
    protected $guarded = ['id'];
    // add hidden
    protected $hidden = ['created_at', 'updated_at'];
}
