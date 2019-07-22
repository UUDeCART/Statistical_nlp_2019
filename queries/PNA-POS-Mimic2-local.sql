select dt.text, 1 as label from 
      (select  dx.subject_id, dx.hadm_id, n.charttime, dx.icd9_code, dx.seq_num, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'pneumonia', '')))/LENGTH('pneumonia')) as pneumonia, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'infiltrate', '')))/LENGTH('infiltrate')) as infiltrate, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'consolidation', '')))/LENGTH('consolidation')) as consolidation, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'opacity', '')))/LENGTH('opacity')) as opacity, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'opacification', '')))/LENGTH('opacification')) as opacification, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'airspace', '')))/LENGTH('airspace')) as airspace, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bilateral', '')))/LENGTH('bilateral')) as bilateral, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'effusion', '')))/LENGTH('effusion')) as effusion, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'opacities', '')))/LENGTH('opacities')) as opacities, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'abnormality', '')))/LENGTH('abnormality')) as abnormality, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'patchy', '')))/LENGTH('patchy')) as patchy, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'aspiration', '')))/LENGTH('aspiration')) as aspiration, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bibasilar', '')))/LENGTH('bibasilar')) as bibasilar, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'density', '')))/LENGTH('density')) as density, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'infectious', '')))/LENGTH('infectious')) as infectious, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'infection', '')))/LENGTH('infection')) as infection, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'parenchymal', '')))/LENGTH('parenchymal')) as parenchymal, 
               n.text 
       from mimic.noteevents n 
       join mimic.diagnoses_icd dx on n.subject_id = dx.subject_id 
                       and n.hadm_id = dx.hadm_id 
                       and n.category = 'Radiology' 
       where (1 = 1) 
             and dx.seq_num = 1 
             and (dx.icd9_code = '4800' 
                    or dx.icd9_code = '4801' 
                    or dx.icd9_code = '4802' 
                    or dx.icd9_code = '4803' 
                    or dx.icd9_code = '4808' 
                    or dx.icd9_code = '4809' 
                    or dx.icd9_code = '481' 
                    or dx.icd9_code = '4820' 
                    or dx.icd9_code = '4821' 
                    or dx.icd9_code = '4822' 
                    or dx.icd9_code = '48230' 
                    or dx.icd9_code = '48231' 
                    or dx.icd9_code = '48232' 
                    or dx.icd9_code = '48239' 
                    or dx.icd9_code = '48240' 
                    or dx.icd9_code = '48241' 
                    or dx.icd9_code = '48249' 
                    or dx.icd9_code = '48281' 
                    or dx.icd9_code = '48282' 
                    or dx.icd9_code = '48283' 
                    or dx.icd9_code = '48289' 
                    or dx.icd9_code = '4829' 
                    or dx.icd9_code = '4830' 
                    or dx.icd9_code = '4831' 
                    or dx.icd9_code = '4838' 
                    or dx.icd9_code = '4841' 
                    or dx.icd9_code = '4843' 
                    or dx.icd9_code = '4845' 
                    or dx.icd9_code = '4846' 
                    or dx.icd9_code = '4847' 
                    or dx.icd9_code = '4848' 
                    or dx.icd9_code = '485' 
                    or dx.icd9_code = '486' 
                    or dx.icd9_code = '4870' 
                    or dx.icd9_code = '4871')) dt 
where (dt.pneumonia + dt.infiltrate + dt.consolidation + dt.opacity + dt.opacification + dt.airspace + dt.bilateral + dt.effusion + 
       dt.opacities + dt.abnormality + dt.patchy + dt.aspiration + dt.bibasilar + dt.density + dt.infectious + dt.infection + 
       dt.parenchymal) > 0 
order by (dt.pneumonia + dt.infiltrate + dt.consolidation + dt.opacity + dt.opacification + dt.airspace + dt.bilateral + dt.effusion + 
          dt.opacities + dt.abnormality + dt.patchy + dt.aspiration + dt.bibasilar + dt.density + dt.infectious + dt.infection + 
          dt.parenchymal) desc 
limit 3000 
