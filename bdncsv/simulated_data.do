capture log close
cd ~/desktop
log using simulated_data.log, replace 
import delimited "simulated_data.csv", clear 
g time = time_to_kidney_failure * 100
stset time, fail(status)
#delimit ;
sts graph, 
    fail 
	per(100) 
	ylab(,
	    format(%2.0f)) 
	yti("%",
	    orientation(horizontal)) 
	xti("Years")
	ti("")
	tmax(30)
; 
#delimit cr
graph export simulated_data.png, replace 
encode race,g(racecat)
encode education,g(educat)
stcox age sbp scr bmi hba1c hypertension smoke i.racecat i.educat male
matrix list e(b)
matrix list e(V)
log close 