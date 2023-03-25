belief network "Sub0"

node N2
{
    name : "Age";
    type : discrete[2] = 
    {
        "S_0_72",
        "S_73_inf"
    };
    position : (207, 95);
}

node N3
{
    name : "Gender";
    type : discrete[2] = 
    {
        "S_female",
        "S_male"
    };
    position : (361, 95);
}

node N4
{
    name : "Education";
    type : discrete[2] = 
    {
        "S_0_13",
        "S_14_inf"
    };
    position : (515, 95);
}

node N6
{
    name : "Diagnosis";
    type : discrete[2] = 
    {
        "S_negative",
        "S_positive"
    };
    position : (351, 220);
}

node N14
{
    name : "Mini mental state score";
    type : discrete[3] = 
    {
        "S_0_17",
        "S_18_26",
        "S_27_30"
    };
    position : (74, 370);
}

node N8
{
    name : "Clinical dementia rating scale";
    type : discrete[5] = 
    {
        "S_0_normal_control",
        "S_0_5_very_mild",
        "S_1_mild",
        "S_2_moderate",
        "S_3_severe"
    };
    position : (255, 369);
}

node N15
{
    name : "Verbal fluency test score";
    type : discrete[3] = 
    {
        "S_0_4",
        "S_5_11",
        "S_12_inf"
    };
    position : (437, 367);
}

node N11
{
    name : "Pfeffer questionnaire score";
    type : discrete[3] = 
    {
        "S_0",
        "S_1_2",
        "S_3_inf"
    };
    position : (586, 366);
}

node N16
{
    name : "Clock drawing test scale";
    type : discrete[6] = 
    {
        "S_0",
        "S_1",
        "S_2",
        "S_3",
        "S_4",
        "S_5"
    };
    position : (740, 366);
}

node N17
{
    name : "Trial making test";
    type : discrete[3] = 
    {
        "S_0_16",
        "S_17_59",
        "S_59_inf"
    };
    position : (208, 507);
}

node N55
{
    name : "Stroop color word test";
    type : discrete[2] = 
    {
        "S_0_15",
        "S_16_inf"
    };
    position : (362, 504);
}

node N79
{
    name : "Lawton scale";
    type : discrete[2] = 
    {
        "S_0_9",
        "S_10_inf"
    };
    position : (516, 508);
}

node N12
{
    name : "IQCode score";
    type : discrete[2] = 
    {
        "S_0_3_55",
        "S_3_56_inf"
    };
    position : (235, 626);
}

node N86
{
    name : "Berg balance scale";
    type : discrete[2] = 
    {
        "S_0_51",
        "S_52_inf"
    };
    position : (389, 626);
}

node N7
{
    name : "Depression";
    type : discrete[2] = 
    {
        "S_absence",
        "S_presence"
    };
    position : (543, 626);
}

probability (N2)
{
    0.43820000, 0.56180000;
}

probability (N3)
{
    0.82440000, 0.17560000;
}

probability (N4)
{
    0.94370000, 0.05630000;
}

probability (N6 | N2, N3, N4)
{
    (0, 0, 0, 0) : 0.60700000, 0.39300000;
    (0, 0, 0, 0) : 1.00000000, 0.00000000;
    (0, 0, 0, 0) : 0.35660000, 0.64340000;
    (0, 0, 0, 0) : 1.00000000, 0.00000000;
    (0, 0, 0, 0) : 0.32900000, 0.67100000;
    (0, 0, 0, 0) : 0.24620000, 0.75380000;
    (0, 0, 0, 0) : 0.10770000, 0.89230000;
    (0, 0, 0, 0) : 0.00000000, 1.00000000;
}

probability (N14 | N6)
{
    (0, 0) : 0.12130000, 0.42420000, 0.45450000;
    (0, 0) : 0.57930000, 0.40480000, 0.01590000;
}

probability (N8 | N6)
{
    (0, 0) : 0.13420000, 0.68290000, 0.15850000, 0.01220000, 0.01220000
    ;
    (0, 0) : 0.00000000, 0.01520000, 0.42750000, 0.24430000, 0.31300000
    ;
}

probability (N15 | N6)
{
    (0, 0) : 0.00000000, 0.28420000, 0.71580000;
    (0, 0) : 0.27640000, 0.58540000, 0.13820000;
}

probability (N11 | N6)
{
    (0, 0) : 0.33780000, 0.14870000, 0.51350000;
    (0, 0) : 0.00000000, 0.03130000, 0.96870000;
}

probability (N16 | N6)
{
    (0, 0) : 0.00000000, 0.54740000, 0.25260000, 0.20000000, 0.00000000
    , 0.00000000;
    (0, 0) : 0.19840000, 0.47410000, 0.17240000, 0.13790000, 0.00860000
    , 0.00860000;
}

probability (N17 | N6)
{
    (0, 0) : 0.00000000, 0.31330000, 0.68670000;
    (0, 0) : 0.18030000, 0.07680000, 0.74290000;
}

probability (N55 | N6)
{
    (0, 0) : 0.55200000, 0.44800000;
    (0, 0) : 0.10140000, 0.89860000;
}

probability (N79 | N6)
{
    (0, 0) : 0.53950000, 0.46050000;
    (0, 0) : 0.05590000, 0.94410000;
}

probability (N12 | N6)
{
    (0, 0) : 0.43010000, 0.56990000;
    (0, 0) : 0.17550000, 0.82450000;
}

probability (N86 | N6)
{
    (0, 0) : 0.34190000, 0.65810000;
    (0, 0) : 0.79640000, 0.20360000;
}

probability (N7 | N6)
{
    (0, 0) : 0.82280000, 0.17720000;
    (0, 0) : 0.57940000, 0.42060000;
}
