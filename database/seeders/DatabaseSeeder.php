<?php

namespace Database\Seeders;

use App\Models\Benefit;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $benefits = [
            'Social Pension' => [
                'description' => '-60 above
                -Quarterly payout
                -Data base sa system ni region
                -Indigent senior citizen without SSS, GSIS PVAO or any benefits from government',
                'min_age' => 60,
                'max_age' => 100,
                'amount' => 500
            ],
            'Cash Incentive A' => [
                'description' => '- Once lang maka recieved every bracket
                85-90 (10k)',
                'min_age' => 85,
                'max_age' => 90,
                'amount' => 10000
            ],
            'Cash Incentive B' => [
                'description' => '- Once lang maka recieved every bracket
                91-95 (15k)',
                'min_age' => 91,
                'max_age' => 95,
                'amount' => 15000
            ],
            'Cash Incentive C' => [
                'description' => '- Once lang maka recieved every bracket
                96-99 (20k)',
                'min_age' => 96,
                'max_age' => 99,
                'amount' => 20000
            ],
            'Birthday Cash Gift' => [
                'description' => '-once a year depende sa budget
-60 to 84 years old
- priority age is 84 pababa hanggang maka abot ng 60',
                'min_age' => 0,
                'max_age' => 0,
                'amount' => 5000
            ],
            'Centenarian' => [
                'description' => '- 100 years old
Incentive they will recieve is
20k from City government
20k from Provincial government
100k from DSWD XII',
                'min_age' => 100,
                'max_age' => 0,
                'amount' => 140000
            ],
        ];

        foreach ($benefits as $name => $data) {
            Benefit::create([
                'name' => $name,
                'description' => $data['description'],
                'min_age' => $data['min_age'],
                'max_age' => $data['max_age'],
                'amount' => $data['amount']
            ]);
        }
    }
}
