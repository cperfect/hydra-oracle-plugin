SELECT
p.ID, p.EFFECT, p.CONDITIONS, p.DESCRIPTION,
tsubject.TEMPLATE "SUBJECT", tresource.TEMPLATE "RESOURCE", taction.TEMPLATE "ACTION"
FROM
pol_hILyTvldVh_p p
LEFT JOIN pol_hILyTvldVh_sr rs ON rs.POLICY = p.ID
LEFT JOIN pol_hILyTvldVh_ar ra ON ra.POLICY = p.ID
LEFT JOIN pol_hILyTvldVh_rr rr ON rr.POLICY = p.ID
LEFT JOIN pol_hILyTvldVh_s tsubject ON rs.SUBJECT = tsubject.ID
LEFT JOIN pol_hILyTvldVh_a taction ON ra.ACTION_ID = taction.ID
LEFT JOIN pol_hILyTvldVh_r tresource ON rr.RESOURCE_ID = tresource.ID
