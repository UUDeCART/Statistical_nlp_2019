select dt.text, 0 as label from 
       (select  dx.subject_id, dx.hadm_id, n.charttime, dx.icd9_code, dx.seq_num, 
                n.text 
        from mimic.noteevents n 
        join mimic.diagnoses_icd dx on n.subject_id = dx.subject_id 
                        and n.hadm_id = dx.hadm_id 
                        and n.category = 'Radiology' 
        where (1 = 1) 
               and dx.seq_num = 1 
               and (dx.icd9_code != '4800' 
                     and dx.icd9_code != '4801' 
                     and dx.icd9_code != '4802' 
                     and dx.icd9_code != '4803' 
                     and dx.icd9_code != '4808' 
                     and dx.icd9_code != '4809' 
                     and dx.icd9_code != '481' 
                     and dx.icd9_code != '4820' 
                     and dx.icd9_code != '4821' 
                     and dx.icd9_code != '4822' 
                     and dx.icd9_code != '48230' 
                     and dx.icd9_code != '48231' 
                     and dx.icd9_code != '48232' 
                     and dx.icd9_code != '48239' 
                     and dx.icd9_code != '48240' 
                     and dx.icd9_code != '48241' 
                     and dx.icd9_code != '48249' 
                     and dx.icd9_code != '48281' 
                     and dx.icd9_code != '48282' 
                     and dx.icd9_code != '48283' 
                     and dx.icd9_code != '48289' 
                     and dx.icd9_code != '4829' 
                     and dx.icd9_code != '4830' 
                     and dx.icd9_code != '4831' 
                     and dx.icd9_code != '4838' 
                     and dx.icd9_code != '4841' 
                     and dx.icd9_code != '4843' 
                     and dx.icd9_code != '4845' 
                     and dx.icd9_code != '4846' 
                     and dx.icd9_code != '4847' 
                     and dx.icd9_code != '4848' 
                     and dx.icd9_code != '485' 
                     and dx.icd9_code != '486' 
                     and dx.icd9_code != '4870' 
                     and dx.icd9_code != '4871')) dt 
limit 10000 
