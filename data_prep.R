## Data clean up (run it just once)
# d_raw = fread('data/raw/responses.csv')
d_raw = fread('data/raw/raw_processed_2.csv')
d = d_raw[, !c('Venmo', 'Amazon gift card (Email)','Paypal', 'treatment - Actual','treatment_actual')]
# setnames(d, "political leaning", "political_leaning")

summary(d)
d = d[, age:= as.factor(age)]
d = d[, political_leaning:= as.factor(political_leaning)]
d = d[, hh_income:= as.factor(hh_income)]
d = d[, race:= as.factor(race)]
d = d[, education:= as.factor(education)]
d = d[, gender:= as.factor(gender)]
d = d[, police_abolition_nps_grp:= as.factor(police_abolition_nps_grp)]
d = d[, defunding_police_nps_grp:= as.factor(defunding_police_nps_grp)]
d = d[, new_prisons_nps_grp:= as.factor(new_prisons_nps_grp)]
d = d[, police_safer_nps_grp:= as.factor(police_safer_nps_grp)]
d[is.na(d)] <- 0
d = d[, xlab_grp:= ifelse(xlabs_id == 0, 0, 1)]
fwrite(d, file = "data/analysis/responses.csv")
