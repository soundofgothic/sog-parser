-- Assign guild_id to each recording which has npc assigned
UPDATE recordings r SET guild_id = (SELECT n.guild_id FROM npcs n WHERE n.id = r.npc_id) where r.npc_id IS NOT NULL;
