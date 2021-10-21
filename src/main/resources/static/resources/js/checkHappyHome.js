
        $(document).ready(function(){
            
            var q4_1_house = 0;
            var q4_1_salary = 0;
            
            var q5_2_households = 0;
            var q5_2_house_salary = 0;
            var q5_2_salary = 0;
            
            var q3_3_households = 0;
            var q3_3_house_salary = 0;
            
            
            $(".reset").click(function(){ 
                
                q4_1_house = 0;
                q4_1_salary = 0;
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;

                q3_3_households = 0;
                q3_3_house_salary = 0;
                
                $("input:radio").prop("checked",false);
                $(".q_add").removeClass('on');
                $(".not_Beneficiary").removeClass('on');
                $(".Bene").removeClass('on');
            });
            
            $(".q1 input:radio").click(function(){
                let val=$(this).val();
                if(val=='대학생'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".q_add").removeClass('on');
                    $(".q_add:checked").prop('checked',false);
                    $(".q2_1").addClass('on');
                    $(".q_add input:radio").prop("checked",false);
                    $(".Bene").removeClass('on'); 
                
                    q4_1_house = 0;
                    q4_1_salary = 0;

                    q5_2_households = 0;
                    q5_2_house_salary = 0;
                    q5_2_salary = 0;

                    q3_3_households = 0;
                    q3_3_house_salary = 0;     
                    
                }else if(val=='청년'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".q_add").removeClass('on');
                    $(".q_add:checked").prop('checked',false);
                    $(".q2_2").addClass('on');
                    $(".q_add input:radio").prop("checked",false);
                    $(".Bene").removeClass('on'); 
                
                    q4_1_house = 0;
                    q4_1_salary = 0;

                    q5_2_households = 0;
                    q5_2_house_salary = 0;
                    q5_2_salary = 0;

                    q3_3_households = 0;
                    q3_3_house_salary = 0;
                    
                }else if(val=='신혼부부'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".q_add:checked").prop('checked',false);
                    $(".q_add").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q_add input:radio").prop("checked",false);
                    $(".Bene").removeClass('on'); 
                
                    q4_1_house = 0;
                    q4_1_salary = 0;

                    q5_2_households = 0;
                    q5_2_house_salary = 0;
                    q5_2_salary = 0;

                    q3_3_households = 0;
                    q3_3_house_salary = 0;
                }
            }); 
            
            // 대학생
            
            
            $(".q2_1 input:radio").click(function(){ 
                
                q4_1_house = 0;
                q4_1_salary = 0;
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q3_1").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            
            $(".q3_1 input:radio").click(function(){ 
                
                q4_1_house = 0;
                q4_1_salary = 0;
                let val=$(this).val();
                if(val=='y'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q3_1").addClass('on');
                    $(".q4_1").addClass('on');
                    $(".q3_1_2 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_1").removeClass('on');
                    $(".q3_1_2").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            $(".q3_1_2 input:radio").click(function(){ 
                
                q4_1_house = 0;
                q4_1_salary = 0;
                let val=$(this).val();
                if(val=='y'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_1").addClass('on');
                    $(".q3_1").addClass('on');
                    $(".q3_1_2").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q3_1").addClass('on');
                    $(".q3_1_2").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
                        
            $(".q4_1 .households").click(function(){
                
            let val=$(this).val();
                
               q4_1_house=val;
                if(q4_1_salary!=0){
                    if(q4_1_house>=q4_1_salary && q4_1_salary!=8){
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5_1").addClass('on')
                        $(".q5 input:radio").prop("checked",false);
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5 input:radio").prop("checked",false);
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
            }); 
            
            $(".q4_1 .salary").click(function(){
                
                let val=$(this).val();
                
                q4_1_salary=val;
                if(q4_1_house!=0){
                    if(q4_1_house>=q4_1_salary && q4_1_salary!=8){
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5_1").addClass('on')
                        $(".q5 input:radio").prop("checked",false);
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5 input:radio").prop("checked",false);
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
            });
             
            
            $(".q5_1 input:radio").click(function(){
                
                let val=$(this).val();

                    if(val=='y'){
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q5_1").addClass('on');
                        $(".q6_1").addClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                  
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".q5_1").addClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                
            });
                  
            $(".q6_1 input:radio").click(function(){
                let val=$(this).val();
                    if(val=='n'){
                        $(".not_Beneficiary").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q6_1").addClass('on');
                        $(".uni_Bene").addClass('on');
                        $(".q7 input:radio").prop("checked",false);
                    }else{ 
                  
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".q6_1").addClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q7 input:radio").prop("checked",false);
                    }
                
            });
            
            
            
            // 청년            
            
            $(".q2_2 input:radio").click(function(){
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q3_2").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            
            $(".q3_2 input:radio").click(function(){
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;
                let val=$(this).val();
                if(val=='y'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_2").addClass('on');
                    $(".q3_2").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q3_2").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
              $(".q4_2 input:radio").click(function(){
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;
                let val=$(this).val();
                  
                if(val==0){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_2").addClass('on');
                    $(".q4_2_1").addClass('on');
                    $(".q4_2_1 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val==2){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_2").addClass('on');
                    $(".q5_2").addClass('on');
                    $(".q4_2_1 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false); 
                }else{
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_2").addClass('on');
                    $(".q4_2_1").addClass('on');
                    $(".q4_2_1 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                    
                }
            });
            
              $(".q4_2_1 input:radio").click(function(){
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;
                let val=$(this).val();
                  
                if(val=='y'){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_2").addClass('on');
                    $(".q4_2_1").addClass('on');
                    $(".q5_2").addClass('on');
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else {                     
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_2").addClass('on');
                    $(".q4_2_1").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
             $(".q5_2 input:radio").click(function(){
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;
                let val=$(this).val();
                  
                if(val==0){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q5_2").addClass('on');
                    $(".q5_2_1").addClass('on');
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else {                     
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q5_2").addClass('on');
                    $(".q5_2_2").addClass('on');
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
             $(".q5_2 input:radio").click(function(){
                
                q5_2_households = 0;
                q5_2_house_salary = 0;
                q5_2_salary = 0;
                let val=$(this).val();
                  
                if(val==0){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q5_2").addClass('on');
                    $(".q5_2_1").addClass('on');
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else {                     
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q5_2").addClass('on');
                    $(".q5_2_2").addClass('on');
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            $(".q5_2_households").click(function(){
                
                let val=$(this).val();
                
               q5_2_households=val;
                
                if(q5_2_house_salary!=0 && q5_2_salary!=0){
                    if(
                        q5_2_households>=q5_2_house_salary
                        && q5_2_households>=q5_2_salary
                        && q5_2_house_salary!=8 && q5_2_salary!=8){
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5_2").addClass('on')
                        $(".q5_2_1").addClass('on');
                        $(".q6_2").addClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".q5_2").addClass('on')
                        $(".q5_2_1").addClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
                
            }); 
            
            $(".q5_2_house_salary").click(function(){
                
                let val=$(this).val();
                
               q5_2_house_salary=val;
                
                if(q5_2_households!=0 && q5_2_salary!=0){
                    if(
                        q5_2_households>=q5_2_house_salary
                        && q5_2_households>=q5_2_salary
                        && q5_2_house_salary!=8 && q5_2_salary!=8){
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5_2").addClass('on')
                        $(".q5_2_1").addClass('on');
                        $(".q6_2").addClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".q5_2").addClass('on')
                        $(".q5_2_1").addClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
            }); 
            
            $(".q5_2_salary").click(function(){
                
                let val=$(this).val();
                
                q5_2_salary=val;
                if(q5_2_households!=0 && q5_2_house_salary!=0){
                    if(
                        q5_2_households>=q5_2_house_salary
                        && q5_2_households>=q5_2_salary
                        && q5_2_house_salary!=8 && q5_2_salary!=8){
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5_2").addClass('on')
                        $(".q5_2_1").addClass('on');
                        $(".q6_2").addClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".q5_2").addClass('on')
                        $(".q5_2_1").addClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
            });
             
             $(".q5_2_2 input:radio").click(function(){
                let val=$(this).val();
                  
                if(val=='y'){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q6_2").addClass('on');
                    $(".q7 input:radio").prop("checked",false);
                }else {                     
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q7 input:radio").prop("checked",false);
                }
            });
             
             $(".q6_2 input:radio").click(function(){
                let val=$(this).val();
                  
                if(val=='y'){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q7").addClass('on');
                    $(".q7 input:radio").prop("checked",false);
                }else {                     
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q7 input:radio").prop("checked",false);
                }
            });
             
             $(".q7 input:radio").click(function(){
                let val=$(this).val();
                  
                if(val=='y'){                    
                    $(".not_Beneficiary").removeClass('on');
                    $(".youth_Bene").addClass('on');
                    $(".q7").addClass('on');
                }else {                     
                    $(".not_Beneficiary").removeClass('on');
                    $(".youth_Bene").removeClass('on');
                    $(".not_Beneficiary").addClass('on');
                }
            });
                        
            // 신혼부부
            
            $(".q2_3 input:radio").click(function(){

                q3_3_households = 0;
                q3_3_house_salary = 0;
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q2").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_1").addClass('on');
                    $(".q2_3_1 input:radio").prop("checked",false);
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q2").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_2").addClass('on');
                    $(".q2_3_2 input:radio").prop("checked",false);
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            $(".q2_3_1 input:radio").click(function(){

                q3_3_households = 0;
                q3_3_house_salary = 0;
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_1").addClass('on');
                    $(".q2_3_1_1").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q2").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_1").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q2_3_1_1 input:radio").prop("checked",false);
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });            
            
            $(".q2_3_1_1 input:radio").click(function(){

                q3_3_households = 0;
                q3_3_house_salary = 0;
                let val=$(this).val();
                if(val=='n'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_1").addClass('on');
                    $(".q2_3_1_1").addClass('on');
                    $(".q3_3").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='y'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3_1").addClass('on');
                    $(".q2_3_1_1").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            $(".q2_3_2 input:radio").click(function(){

                q3_3_households = 0;
                q3_3_house_salary = 0;
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_2").addClass('on');
                    $(".q3_3").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q2").removeClass('on');
                    $(".q3").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q2_3").addClass('on');
                    $(".q2_3_2").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q3 input:radio").prop("checked",false);
                    $(".q4 input:radio").prop("checked",false);
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            
            $(".q3_3_households").click(function(){
                
                let val=$(this).val();
                
               q3_3_households=val;
                
                if(q3_3_households!=0 && q3_3_house_salary!=0){
                    if(
                        q3_3_households>=q3_3_house_salary
                        && q3_3_house_salary!=8){
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q4_3").addClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
                
            }); 
            
            $(".q3_3_house_salary").click(function(){
                
                let val=$(this).val();
                
               q3_3_house_salary=val;
                
                if(q3_3_households!=0 && q3_3_house_salary!=0){
                    if(
                        q3_3_households>=q3_3_house_salary
                        && q3_3_house_salary!=8){
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q4_3").addClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }else{
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q6").removeClass('on');
                        $(".q7").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                }
            }); 
            
            $(".q4_3 input:radio").click(function(){
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_3").addClass('on');
                    $(".q5_3").addClass('on');
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q4").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q4_3").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q5 input:radio").prop("checked",false);
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            $(".q5_3 input:radio").click(function(){
                let val=$(this).val();
                if(val=='y'){ 
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q5_3").addClass('on');
                    $(".new_Bene").addClass('on');
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }else if(val=='n'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".Bene").removeClass('on');
                    $(".q5").removeClass('on');
                    $(".q6").removeClass('on');
                    $(".q7").removeClass('on');
                    $(".q5_3").addClass('on');
                    $(".not_Beneficiary").addClass('on');
                    $(".q6 input:radio").prop("checked",false);
                    $(".q7 input:radio").prop("checked",false);
                }
            });
            
            
        });
    