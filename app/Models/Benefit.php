<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;


class Benefit extends Model
{

    public function senior_citizens(): HasMany
    {
        return $this->hasMany(MasterList::class);
    }
    public function payroll()
    {
        return $this->hasMany(Payroll::class);
    }
    public function seniorCitizens()
    {
        return $this->belongsToMany(MasterList::class);
    }
    public function payrolls()
    {
        return $this->hasMany(Payroll::class);
    }
}
