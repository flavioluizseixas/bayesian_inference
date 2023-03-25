belief network "Sub0"

node N2
{
    name : "Age";
    type : discrete[2] = 
    {
        "S_0_72",
        "S_73_inf"
    };
    position : (159, 92);
}

node N3
{
    name : "Gender";
    type : discrete[2] = 
    {
        "S_female",
        "S_male"
    };
    position : (313, 92);
}

node N4
{
    name : "Education";
    type : discrete[2] = 
    {
        "S_0_13",
        "S_14_inf"
    };
    position : (467, 92);
}

node N6
{
    name : "Diagnosis";
    type : discrete[2] = 
    {
        "S_negative",
        "S_positive"
    };
    position : (306, 218);
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
    position : (265, 369);
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
    position : (452, 369);
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
    position : (606, 368);
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
    position : (760, 367);
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
    position : (153, 506);
}

node N55
{
    name : "Stroop color word test";
    type : discrete[2] = 
    {
        "S_0_15",
        "S_16_inf"
    };
    position : (307, 505);
}

node N79
{
    name : "Lawton scale";
    type : discrete[2] = 
    {
        "S_0_9",
        "S_10_inf"
    };
    position : (461, 508);
}

node N12
{
    name : "IQCode score";
    type : discrete[2] = 
    {
        "S_0_3_55",
        "S_3_56_inf"
    };
    position : (187, 613);
}

node N86
{
    name : "Berg balance scale";
    type : discrete[2] = 
    {
        "S_0_51",
        "S_52_inf"
    };
    position : (341, 613);
}

node N7
{
    name : "Depression";
    type : discrete[2] = 
    {
        "S_absence",
        "S_presence"
    };
    position : (495, 613);
}

probability (N2)
{
    0.33710000, 0.66290000;
}

probability (N3)
{
    0.76920000, 0.23080000;
}

probability (N4)
{
    0.96350000, 0.03650000;
}

probability (N6 | N2, N3, N4)
{
    (0, 0, 0, 0) : 0.46580000, 0.53420000;
    (0, 0, 0, 0) : 0.00000000, 1.00000000;
    (0, 0, 0, 0) : 0.62500000, 0.37500000;
    (0, 0, 0, 0) : 1.00000000, 0.00000000;
    (0, 0, 0, 0) : 0.43230000, 0.56770000;
    (0, 0, 0, 0) : 0.00000000, 1.00000000;
    (0, 0, 0, 0) : 0.24180000, 0.75820000;
    (0, 0, 0, 0) : 0.00000000, 1.00000000;
}

probability (N14 | N6)
{
    (0, 0) : 0.72580000, 0.22580000, 0.04840000;
    (0, 0) : 0.58330000, 0.38540000, 0.03130000;
}

probability (N8 | N6)
{
    (0, 0) : 0.00000000, 0.01540000, 0.70770000, 0.16920000, 0.10770000
    ;
    (0, 0) : 0.00000000, 0.01020000, 0.41840000, 0.25510000, 0.31630000
    ;
}

probability (N15 | N6)
{
    (0, 0) : 0.24240000, 0.65150000, 0.10610000;
    (0, 0) : 0.26660000, 0.56670000, 0.16670000;
}

probability (N11 | N6)
{
    (0, 0) : 0.00000000, 0.01560000, 0.98440000;
    (0, 0) : 0.00000000, 0.03260000, 0.96740000;
}

probability (N16 | N6)
{
    (0, 0) : 0.10940000, 0.78120000, 0.09380000, 0.01560000, 0.00000000
    , 0.00000000;
    (0, 0) : 0.20690000, 0.47130000, 0.13790000, 0.17240000, 0.01150000
    , 0.00000000;
}

probability (N17 | N6)
{
    (0, 0) : 0.05830000, 0.05820000, 0.88350000;
    (0, 0) : 0.29840000, 0.10590000, 0.59570000;
}

probability (N55 | N6)
{
    (0, 0) : 0.50000000, 0.50000000;
    (0, 0) : 0.11170000, 0.88830000;
}

probability (N79 | N6)
{
    (0, 0) : 0.50000000, 0.50000000;
    (0, 0) : 0.03350000, 0.96650000;
}

probability (N12 | N6)
{
    (0, 0) : 0.07550000, 0.92450000;
    (0, 0) : 0.26430000, 0.73570000;
}

probability (N86 | N6)
{
    (0, 0) : 0.50000000, 0.50000000;
    (0, 0) : 0.78860000, 0.21140000;
}

probability (N7 | N6)
{
    (0, 0) : 0.77610000, 0.22390000;
    (0, 0) : 0.53330000, 0.46670000;
}
