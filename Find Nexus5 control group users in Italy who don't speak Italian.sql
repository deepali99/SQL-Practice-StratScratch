/*
https://platform.stratascratch.com/coding/9609-find-nexus5-control-group-users-in-italy-who-dont-speak-italian?code_type=3
Find user id, language, and location of all Nexus 5 control group users in Italy who do not speak Italian. 
Sort the results in ascending order based on the occurred_at value of the playbook_experiments dataset.

*/


SELECT 
    exp.user_id,
    language, 
    location
FROM playbook_experiments exp JOIN playbook_users usr
ON exp.user_id = usr.user_id
WHERE 
    location = 'Italy' AND 
    experiment_group = 'control_group' AND 
    device = 'nexus 5' AND 
    language <> 'Italian'
ORDER BY 
    occurred_at DESC
