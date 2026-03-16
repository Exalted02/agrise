<?php
defined('BASEPATH') or exit('No direct script access allowed');


class Cron extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper(['url', 'language','xml']);

    }
    
    public function fetch_mandi_prices() {
        $apiKey = "579b464db66ec23bdd00000189d7be4ebf514e50665ba8f9f2103c0f"; // Replace with your key
        $state  = urlencode("Maharashtra");
        $limit  = 1000;
        $offset = 0;
        $allRecords = [];

        echo "Starting fetch for state: Maharashtra\n";

        while(true){
            $url = "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?"
                ."api-key=".$apiKey
                ."&format=json"
                ."&limit=".$limit
                ."&offset=".$offset
                ."&filters[state]=".$state;

            $response = $this->fetchAPI($url);
            if(!$response){
                echo "API failed at offset $offset\n";
                break;
            }

            $data = json_decode($response,true);
            if(!isset($data['records']) || count($data['records'])==0){
                echo "No more records.\n";
                break;
            }

            foreach($data['records'] as $row){
                $allRecords[] = $row;

                // Example output
                echo $row['district'] . " - " . $row['market'] . " - " . $row['commodity'] . " - " . $row['modal_price'] . " - " . $row['arrival_date'] . "\n";

                // Optional: Save to database
                
                // Prepare unique fields
                $arrival_date = DateTime::createFromFormat('d/m/Y', $row['arrival_date'])->format('Y-m-d');
                
                $check = $this->db->get_where('2026_mandi_prices', [
                    'state' => $row['state'],
                    'district' => $row['district'],
                    'market' => $row['market'],
                    'commodity' => $row['commodity'],
                    'arrival_date' => $arrival_date
                ])->row();
                
                if(!$check){
                    // Insert only if not exists
                    $this->db->insert('2026_mandi_prices', [
                        'state' => $row['state'],
                        'district' => $row['district'],
                        'market' => $row['market'],
                        'commodity' => $row['commodity'],
                        'variety' => $row['variety'],
                        'grade' => $row['grade'],
                        'arrival_date' => $arrival_date,
                        'min_price' => $row['min_price'],
                        'max_price' => $row['max_price'],
                        'modal_price' => $row['modal_price']
                    ]);
                } else {
                    echo "Record already exists: ".$row['market']." - ".$row['commodity']." - ".$arrival_date."\n";
                }
                
            }

            $offset += $limit;
            sleep(2); // avoid 429 Too Many Requests
        }
        

        echo "Total records fetched: " . count($allRecords) . "\n";
        
       // $this->data['main_page'] = 'Cron Mandi Prices';
        
        //$this->load->view('front-end/' . THEME . '/landing_page', $this->data); // Ensure the correct view path
    }

    // Helper function for API with retry
    private function fetchAPI($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // Disable SSL verification if needed
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        
        $response = curl_exec($ch);
        $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
    
        if($response !== false && $httpcode == 200){
            return $response;
        }
        return false;
    }
    /*private function fetchAPI($url){
        $retry = 0;
        while($retry < 5){
            $response = @file_get_contents($url);
            if($response !== false){
                return $response;
            }
            sleep(5);
            $retry++;
        }
        return false;
    }*/
}
