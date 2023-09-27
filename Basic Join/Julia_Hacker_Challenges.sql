/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

with id_data(id,name,ch_count)
AS
(select H.hacker_id as id,name, count(challenge_id)as id_count
FROM Hackers H JOIN Challenges C
On H.hacker_id =C.hacker_id
group by name,H.hacker_id

)
SELECT * FROM id_data
WHERE ch_count IN
(   SELECT ch_count FROM id_data   
    GROUP BY ch_count
    HAVING COUNT(*)=1 
) OR ch_count=(SELECT MAX(ch_count) FROM id_data)  
ORDER BY ch_count DESC,ID
