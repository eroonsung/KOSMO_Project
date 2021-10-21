
        $(document).ready(function(){
            
            var q2_house = 0;
            var q2_salary = 0;
            
            $(".reset").click(function(){ 
                
                q2_house = 0;
                q2_salary = 0;
                
                $("input:radio").prop("checked",false);
                $(".q_add").removeClass('on');
                $(".not_Beneficiary").removeClass('on');
                $(".Bene").removeClass('on');
            });
            
            $(".q1 input:radio").click(function(){
                
                q2_house = 0;
                q2_salary = 0;
                
                
                let val=$(this).val();
                if(val=='y'){
                    $(".not_Beneficiary").removeClass('on');
                    $(".q_add").removeClass('on');
                    $(".q_add:checked").prop('checked',false);
                    $(".q2").addClass('on');
                    $(".q_add input:radio").prop("checked",false);
                    $(".Bene").removeClass('on'); 
                
                }else{
                    $(".Bene").removeClass('on');
                    $(".q_add").removeClass('on');
                    $(".q2").removeClass('on');
                    $(".q_add:checked").prop('checked',false);
                    $(".q_add input:radio").prop("checked",false);
                    $(".not_Beneficiary").addClass('on'); 
                }
            }); 
                        
                
                        
            $(".q2 .households").click(function(){
                
            let val=$(this).val();
                q2_house=val;
                if(q2_salary!=0){
                    if(q2_house>=q2_salary){
                        $(".q3").removeClass('on');
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q3").addClass('on')
                        $(".q3 input:radio").prop("checked",false);
                        $(".q4 input:radio").prop("checked",false);
                        $(".q5 input:radio").prop("checked",false);
                    }else{
                        $(".q3").removeClass('on');
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q3 input:radio").prop("checked",false);
                        $(".q4 input:radio").prop("checked",false);
                        $(".q5 input:radio").prop("checked",false);
                    }
                }
            }); 
            
            $(".q2 .salary").click(function(){
                
                let val=$(this).val();
                q2_salary=val;
                
                if(q2_house!=0){
                    if(q2_house>=q2_salary){
                        $(".q3").removeClass('on');
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q3").addClass('on')
                        $(".q3 input:radio").prop("checked",false);
                        $(".q4 input:radio").prop("checked",false);
                        $(".q5 input:radio").prop("checked",false);
                    }else{
                        $(".q3").removeClass('on');
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q3 input:radio").prop("checked",false);
                        $(".q4 input:radio").prop("checked",false);
                        $(".q5 input:radio").prop("checked",false);
                    }
                }
            });
             
            
            $(".q3 input:radio").click(function(){
                
                let val=$(this).val();

                    if(val=='y'){
                        $(".not_Beneficiary").removeClass('on');
                        $(".Bene").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q4").addClass('on');
                        $(".q4 input:radio").prop("checked",false);
                        $(".q5 input:radio").prop("checked",false);
                    }else{
                  
                        $(".q4").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                        $(".Bene").removeClass('on');
                        $(".q6 input:radio").prop("checked",false);
                        $(".q7 input:radio").prop("checked",false);
                    }
                
            });
                  
            $(".q4 input:radio").click(function(){
                let val=$(this).val();
                    if(val=='y'){            
                        $(".Bene").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q5").addClass('on');
                        $(".q5 input:radio").prop("checked",false);
                    }else{ 
                              
                        $(".Bene").removeClass('on');
                        $(".not_Beneficiary").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".Bene").addClass('on');
                    }
                
            });
            
                  
            $(".q5 input:radio").click(function(){
                let val=$(this).val();
                    if(val=='y'){
                        $(".not_Beneficiary").removeClass('on');            
                        $(".Bene").removeClass('on');
                        $(".q5").removeClass('on');
                        $(".q5").addClass('on');
                        $(".Bene").addClass('on');
                    }else{ 
                        $(".q5").removeClass('on');
                        $(".q5").addClass('on');                  
                        $(".Bene").removeClass('on');
                        $(".not_Beneficiary").addClass('on');
                    }
                
            });
                
        });
    