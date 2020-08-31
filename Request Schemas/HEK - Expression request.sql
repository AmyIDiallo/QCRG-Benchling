{
    "fields": [
        {
            "isMulti": false,
            "type": "date",
            "displayName": "Date Requested",
            "name": "date_needed",
            "isRequired": true
        },
        {
            "isMulti": false,
            "type": "date",
            "displayName": "[FULFILLER USE] Scheduled On",
            "name": "scheduled_on",
            "isRequired": false
        },
        {
            "isMulti": false,
            "type": "entity_link",
            "displayName": "Proteins",
            "name": "protein",
            "isRequired": false
        },
        {
            "isMulti": false,
            "type": "entity_link",
            "displayName": "Plasmid",
            "name": "plasmid",
            "isRequired": false
        }
    ],
    "idPrefix": "EXP-UCSF",
    "taskSchemas": [],
    "samplesSchema": [
        {
            "isMulti": false,
            "isRequired": false,
            "type": "entity_link",
            "name": "Construct"
        }
    ]
}

#Template settings
{
    "assignees": [
        "diwanji",
        "Nowotny",
        "Amber"
    ],
    "defaultProject": null,
    "taskTemplates": {},
    "fields": {
        "protein": null,
        "date_needed": null,
        "plasmid": null,
        "scheduled_on": null
    }
}
