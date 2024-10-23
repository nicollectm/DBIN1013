-- Update Fluffy's event to include antibiotics
INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ("Fluffy", "2020-10-15", "vet", "antibiotics")
ON DUPLICATE KEY UPDATE
    eventdate = VALUES(eventdate),
    eventtype = VALUES(eventtype),
    remark = VALUES(remark);

-- Insert Hammy into petPet table
INSERT INTO petPet (petname, owner, species, gender, birth, death) VALUES
    ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL)
ON DUPLICATE KEY UPDATE
    owner = VALUES(owner),
    species = VALUES(species),
    gender = VALUES(gender),
    birth = VALUES(birth),
    death = VALUES(death);

-- Insert Hammy's event
INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ("Hammy", "2020-10-15", "vet", "antibiotics")
ON DUPLICATE KEY UPDATE
    eventdate = VALUES(eventdate),
    eventtype = VALUES(eventtype),
    remark = VALUES(remark);

-- Update Fluffy's litter information
INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ("Fluffy", "2020-10-16", "litter", "5 kittens, 2 male")
ON DUPLICATE KEY UPDATE
    eventdate = VALUES(eventdate),
    eventtype = VALUES(eventtype),
    remark = VALUES(remark);

-- Update Slim's record
UPDATE petEvent
SET remark = "broken rib"
WHERE petname = "Slim" AND eventdate = "1997-08-03";

-- Update Puffball's death date
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball' AND owner = 'Diane';

-- Delete Buffy from petPet table
DELETE FROM petPet
WHERE petname = 'Buffy' AND owner = 'Harold';