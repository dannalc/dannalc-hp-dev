update `wpadaa7doptions` set option_value=replace (option_value,'http://dannalc.tokyo','http://localhost:8000');
update `wpadaa7doptions` set option_value=replace (option_value,'https://dannalc.tokyo','http://localhost:8000');
update `wpadaa7dposts` set guid=replace (guid,'http://dannalc.tokyo','http://localhost:8000');
update `wpadaa7dposts` set guid=replace (guid,'https://dannalc.tokyo','http://localhost:8000');
update `wpadaa7dposts` set post_content=replace (post_content,'http://dannalc.tokyo','http://localhost:8000');
update `wpadaa7dposts` set post_content=replace (post_content,'https://dannalc.tokyo','http://localhost:8000');
update `wpadaa7dpostmeta` set meta_value=replace (meta_value,'http://dannalc.tokyo','http://localhost:8000');
update `wpadaa7dpostmeta` set meta_value=replace (meta_value,'https://dannalc.tokyo','http://localhost:8000');
