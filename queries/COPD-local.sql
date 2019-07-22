select dt.text, 'COPD' as label from 
      (select  dx.subject_id, dx.hadm_id, dx.icd9_code, dx.seq_num, 
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bronchitis', '')))/LENGTH('bronchitis')) as bronchitis,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'copd', '')))/LENGTH('copd')) as copd,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'emphysema', '')))/LENGTH('emphysema')) as emphysema,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'hypoxia', '')))/LENGTH('hypoxia')) as hypoxia,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'hyperinflated', '')))/LENGTH('hyperinflated')) as hyperinflated,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'thickening', '')))/LENGTH('thickening')) as thickening,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'distress', '')))/LENGTH('distress')) as distress,
                  n.text 
          from mimic.noteevents n 
          join mimic.diagnoses_icd dx on n.subject_id = dx.subject_id 
                      and n.hadm_id = dx.hadm_id
                      and n.category = 'Radiology'
          where (1 = 1)
              and dx.seq_num = 1
              and (dx.icd9_code = '490'
                 or dx.icd9_code = '493'
                 or dx.icd9_code = '495'
                 or dx.icd9_code = '496'
                 or dx.icd9_code = '491'
                 or dx.icd9_code = '4910'
                 or dx.icd9_code = '4911'
                 or dx.icd9_code = '4912'
                 or dx.icd9_code = '49120'
                 or dx.icd9_code = '49121'
                 or dx.icd9_code = '49122'
                 or dx.icd9_code = '4918'
                 or dx.icd9_code = '4919'
                 or dx.icd9_code = '492'
                 or dx.icd9_code = '4920'
                 or dx.icd9_code = '4928'
                 or dx.icd9_code = '4932'
                 or dx.icd9_code = '496'
                 or dx.icd9_code = '5181'
                 or dx.icd9_code = '5181'
                 or dx.icd9_code = '5182'
                 or dx.icd9_code = '7702'
                 or dx.icd9_code = '9587'
                 or dx.icd9_code = 'V813'
                 )) dt  
where (bronchitis + copd + emphysema + hypoxia + hyperinflated + thickening + distress) > 0
order by (bronchitis + copd + emphysema + hypoxia + hyperinflated + thickening + distress) desc
limit 500
