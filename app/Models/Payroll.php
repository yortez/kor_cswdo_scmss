<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\HasMany;


use Illuminate\Database\Eloquent\Model;

class Payroll extends Model
{
    protected $fillable = [
        'benefit_id',
        'senior_citizen_id',
        'amount',
        'note',
        'progress',
        'isActive',
        'granted_beneficiary_id',
    ];

    public function senior_citizen()
    {
        return $this->belongsTo(MasterList::class);
    }
    public function benefit()
    {
        return $this->belongsTo(Benefit::class);
    }
    public function seniors()
    {
        return $this
            ->belongsToMany(MasterList::class, 'payroll_senior_citizen')
            ->withPivot('status');
    }
    public function getClaimedSeniorsCountAttribute()
    {
        return $this->seniors()->wherePivot('status', 'Claimed')->count();
    }
}
