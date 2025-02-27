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

    // add fillable
    protected $fillable = [];
    // add guaded
    protected $guarded = ['id'];
    // add hidden
    protected $hidden = ['created_at', 'updated_at'];
}
