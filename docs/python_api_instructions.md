c main module can be in this way:

     init_clips() 
     /*
        verificar se o clips esta instalado e inicia-lo
    */

    int insert_fact(<fact_id:int>, <fact_value:String>)
    /*
        assert fact in clips system using parameters:
        <fact_id> represents fact id as describe below:
            1 - soil_type
            2 - soil_ph
            3 - organic_content
            6 - n_content
            4 - p_content
            5 - k_content
            7 - ca_content
            7 - mg_content
            8 - base_saturation
            9 - aluminum_saturation
            10 - type_of_forage
            11 - annual_or_perennial_culture
            12 - is_first_planting
            13 - plantation_use_type

        second parameter represent value of the fact as a string
        
    */

    get_recommendation()
    /*
        
    */



