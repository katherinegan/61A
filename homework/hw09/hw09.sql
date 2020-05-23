CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-- copy your solution from prev hw!
-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
  FROM dogs, sizes
  WHERE height > min AND height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child 
  FROM parents, dogs 
  WHERE parent = name
  ORDER BY -height;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT child1.child AS sib1, child2.child AS sib2 FROM parents AS child1, parents AS child2
  WHERE child1.parent = child2.parent
  AND child1.child < child2.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT child1.sib1 || " and " || child1.sib2 || " are " || child2.size || " siblings" AS
  sentence FROM siblings AS child1, size_of_dogs AS child2, size_of_dogs AS child3
  WHERE child1.sib1 = child2.name AND child1.sib2 = child3.name AND child2.size = child3.size;
