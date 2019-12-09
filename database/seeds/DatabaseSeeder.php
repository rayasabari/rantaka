<?php

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Model::unguard();

        $this->call(PermissionsTableSeeder::class);
        $this->call(RolesTableSeeder::class);
        $this->call(ConnectRelationshipsSeeder::class);
        $this->call(ThemesTableSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(PropertiSeeder::class);
        $this->call(StatusPropertiSeeder::class);
        $this->call(ProjectSeeder::class);
        $this->call(TipeRUmahSeeder::class);
        $this->call(StatusBookingSeeder::class);
        $this->call(MarketingSeeder::class);
        $this->call(PendanaanSeeder::class);

        Model::reguard();
    }
}
