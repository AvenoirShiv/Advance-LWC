public class NumberToArabic {
    public static Decimal finalNumber;
  // public  ArabCurrency arabcurrency;
    public static String sarabcurrency = 'AED';
        public static ArabCurrencyInfo arabcurrencyInfo;    
        
        public static String englishPrefixText = '';
        public static String englishSuffixText = 'only.';
        public static String arabicPrefixText = '';
        public static String arabicSuffixText = '';
        
        public static long  intergerValue;
        public static Integer  decimalValue;
        
        /**
         * BHD - not implemented
         * JOD - not implemented
         */
    /*  public   enum ArabCurrency {
            AED, SYP, SAR, TND, XAU, JOD, BHD
        } */
    
    public static String[] englishOnes =
            new String[] {
             'Zero', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
             'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'
        };
            public static String[] englishTens =
             new String[] {
             'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'
        };
        
        public static String[] englishGroup =
             new String[] {
             'Hundred ', 'Thousand ', 'Million ', 'Billion ', 'Trillion ', 'Quadrillion ', 'Quintillion ', 'Sextillian ',
             'Septillion', 'Octillion', 'Nonillion', 'Decillion', 'Undecillion', 'Duodecillion', 'Tredecillion',
             'Quattuordecillion', 'Quindecillion', 'Sexdecillion', 'Septendecillion', 'Octodecillion', 'Novemdecillion',
             'Vigintillion', 'Unvigintillion', 'Duovigintillion', '10^72', '10^75', '10^78', '10^81', '10^84', '10^87',
             'Vigintinonillion', '10^93', '10^96', 'Duotrigintillion', 'Trestrigintillion'
        };
        public static String[] englishGroup1 =
        new String[] {
        'Hundred', 'Thousand', 'Million', 'Billion', 'Trillion', 'Quadrillion', 'Quintillion', 'Sextillian'
        };
            public static String[] arabicOnes =
            new String[] {
             '', 'واحد', 'اثنان', 'ثلاثة', 'أربعة', 'خمسة', 'ستة', 'سبعة', 'ثمانية', 'تسعة',
             'عشرة', 'أحد عشر', 'اثنا عشر', 'ثلاثة عشر', 'أربعة عشر', 'خمسة عشر', 'ستة عشر', 'سبعة عشر', 'ثمانية عشر', 'تسعة عشر'
         };

         public static String[] arabicFeminineOnes =
            new String[] {
             '', 'إحدى', 'اثنتان', 'ثلاث', 'أربع', 'خمس', 'ست', 'سبع', 'ثمان', 'تسع',
             'عشر', 'إحدى عشرة', 'اثنتا عشرة', 'ثلاث عشرة', 'أربع عشرة', 'خمس عشرة', 'ست عشرة', 'سبع عشرة', 'ثماني عشرة', 'تسع عشرة'
         };
public static String[] arabicTens =
             new String[] {
             'عشرون', 'ثلاثون', 'أربعون', 'خمسون', 'ستون', 'سبعون', 'ثمانون', 'تسعون'
         };

         public static String[] arabicHundreds =
             new String[] {
             '', 'مائة', 'مئتان', 'ثلاثمائة', 'أربعمائة', 'خمسمائة', 'ستمائة', 'سبعمائة', 'ثمانمائة','تسعمائة'
         };

         public static String[] arabicAppendedTwos =
             new String[] {
             'مئتا', 'ألفا', 'مليونا', 'مليارا', 'تريليونا', 'كوادريليونا', 'كوينتليونا', 'سكستيليونا'
         };

         public static String[] arabicTwos =
             new String[] {
             'مئتان', 'ألفان', 'مليونان', 'ملياران', 'تريليونان', 'كوادريليونان', 'كوينتليونان', 'سكستيليونان'
         };

         public static String[] arabicGroup =
             new String[] {
             'مائة', 'ألف', 'مليون', 'مليار', 'تريليون', 'كوادريليون', 'كوينتليون', 'سكستيليون'
         };
              public static String[] arabicAppendedGroup =
             new String[] {
             '', 'ألفاً', 'مليوناً', 'ملياراً', 'تريليوناً', 'كوادريليوناً', 'كوينتليوناً', 'سكستيليوناً'
         };

         public static String[] arabicPluralGroups =
             new String[] {
             '', 'آلاف', 'ملايين', 'مليارات', 'تريليونات', 'كوادريليونات', 'كوينتليونات', 'سكستيليونات'
         };
             public NumberToArabic() {  
             
        }
         
        public NumberToArabic(Decimal finalNumber, String sarabcurrency) {  
            NumberToArabic.finalNumber = finalNumber;       
            NumberToArabic.sarabcurrency = sarabcurrency;
            NumberToArabic.arabcurrencyInfo = new ArabCurrencyInfo(sarabcurrency);
            
            numberToArabicConvert(finalNumber, sarabcurrency, englishPrefixText, englishSuffixText, arabicPrefixText, arabicSuffixText);
        }
    public NumberToArabic(Decimal finalNumber, String sarabcurrency, String englishPrefixText, String englishSuffixText, String arabicPrefixText, String arabicSuffixText) {
            NumberToArabic.finalNumber = finalNumber;
            NumberToArabic.sarabcurrency = sarabcurrency;
            NumberToArabic.arabcurrencyInfo = new ArabCurrencyInfo(sarabcurrency);
            
            numberToArabicConvert(finalNumber, sarabcurrency, englishPrefixText, englishSuffixText, arabicPrefixText, arabicSuffixText);
        }
        
    
        public static void numberToArabicConvert(Decimal finalNumber, String sarabcurrency, String englishPrefixText, String englishSuffixText, String arabicPrefixText, String arabicSuffixText) {     
            
            NumberToArabic.finalNumber = finalNumber;
            NumberToArabic.sarabcurrency = sarabcurrency;
            NumberToArabic.englishPrefixText = englishPrefixText;
            NumberToArabic.englishSuffixText = englishSuffixText;
            NumberToArabic.arabicPrefixText = arabicPrefixText;
            NumberToArabic.arabicSuffixText = arabicSuffixText;

            extractIntegerAndDecimalParts();
        }
    public static void extractIntegerAndDecimalParts() {    
        
        system.debug('extractIntegerAndDecimalParts');
        String v = String.valueOf(finalNumber).replace(',', '');
            String[] splits = String.valueOf(finalNumber).split('\\.');

             intergerValue = Long.valueOf(splits[0]);

        if (splits.Size() > 1)   
        decimalValue = Integer.valueOf(getDecimalValue(splits[1]));
                
   
            else 
                     decimalValue = 0;
       
        system.debug('decimalValue'+decimalValue + 'intergerValue'+intergerValue);


        }
    public static String getDecimalValue(String decimalPart) {
            String result = '';

            if (arabcurrencyInfo.getPartPrecision() != decimalPart.length()) {
                    Integer decimalPartLength = decimalPart.length();

                    /*
                     * for (int i = 0; i < ArabCurrency.PartPrecision - decimalPartLength; i++) {
                     * decimalPart += '0'; //Fix for 1 number after decimal ( 10.5 , 1442.2 , 375.4
                     * ) }
                     */

                    Integer dec = decimalPart.length() <= arabcurrencyInfo.getPartPrecision()  ?  decimalPart.length() : arabcurrencyInfo.getPartPrecision();  
                result = decimalPart.substring(0, dec);
            }
            else
                result = decimalPart;

            for (Integer i = result.length(); i < arabcurrencyInfo.getPartPrecision(); i++) {
                result += '0';
            }
         system.debug('decimal result...'+result);
        
            return result;
        }
    public static String processGroup(Integer groupNumber) {
        
        
        
            Integer tens = Math.mod(groupNumber ,100);
            system.debug('tens..'+tens);

            Integer hundreds = groupNumber / 100;

            String retVal = '';

            if (hundreds > 0) {
                retVal = String.format('{0} {1}', new List<String>{englishOnes[hundreds], englishGroup[0]});
            }
            if (tens > 0) {
                if (tens < 20) {
                    retVal +=  ((retVal != '') ? ' ' : '') + englishOnes[tens];
                }
                else {
                    Integer ones = Math.mod(tens , 10);

                    tens = (tens / 10) - 2; // 20's offset

                    retVal += ' and '+((retVal != '') ? ' ' : '') + englishTens[tens];

                    if (ones > 0) {
                        retVal += ((retVal != '') ? ' ' : '') + englishOnes[ones];
                    }
                }
            }
            system.debug('retVal.....'+retVal);
            return retVal;
        }   

    public static String convertToArabic(Decimal value, String arabcurrencyCode) {
                        NumberToArabic numberToArab= new NumberToArabic();
                        arabcurrencyInfo = new ArabCurrencyInfo('AED');
                //    arabcurrencyCode= 'AED';
                         system.debug('value..' + value);
         String v = String.valueOf(value).replace(',', '');
                          value= decimal.valueOf(v);
            finalNumber=value.setScale(arabcurrencyInfo.getPartPrecision(), System.roundingMode.HALF_DOWN);
            system.debug('convertToArabic decimalnumber'+finalNumber);
            numberToArabicConvert(value, sarabcurrency, englishPrefixText, englishSuffixText, arabicPrefixText, arabicSuffixText);
            return convertToArabic();
        }
    public static String convertToArabicMtr(Decimal value, String arabcurrencyCode) {
                        NumberToArabic numberToArab= new NumberToArabic();
                        arabcurrencyInfo = new ArabCurrencyInfo('AEDM');
                //    arabcurrencyCode= 'AED';
                         system.debug('value..' + value);
         String v = String.valueOf(value).replace(',', '');
                          value= decimal.valueOf(v);
            finalNumber=value.setScale(arabcurrencyInfo.getPartPrecision(), System.roundingMode.HALF_DOWN);
            system.debug('convertToArabic decimalnumber'+finalNumber);
            numberToArabicConvert(value, sarabcurrency, englishPrefixText, englishSuffixText, arabicPrefixText, arabicSuffixText);
            return convertToArabic();
        }
   
   
    public static String convertToArabic()
        {
                Decimal tempNumber = finalNumber;
         /*   if (tempNumber- (Integer)tempNumber == 0)
            {
                return 'صفر';
            } */
            
            String decimalString = processArabicGroup( decimalValue, -1, 0.0);
            String retVal = ''; 
            Integer group1 = 0;
            
            while ((Long)tempNumber> 0)
            {
                // seperate number into groups
                Integer numberToProcess = Math.mod((Integer)tempNumber,1000);
                system.debug(numberToProcess);

                tempNumber = (tempNumber / 1000);
                // convert group into its text
                String groupDescription = processArabicGroup(numberToProcess, group1, Math.floor(tempNumber.doubleValue()));
                System.debug('groupDescription : ' + groupDescription);
                if (groupDescription != '')
                { // here we add the new converted group to the previous concatenated text
                    if (group1 > 0)
                    {
                        if (retVal != '')
                            retVal = String.format('{0}{1}', new List<String>{'و', retVal});
                        if (numberToProcess != 2)
                        {
                            if (Math.mod(numberToProcess , 100) != 1)
                            {
                                if (numberToProcess >= 3 && numberToProcess <= 10) // for numbers between 3 and 9 we use plural name
                                    retVal = String.format('{0}{1}', new List<String>{arabicPluralGroups[group1], retVal});
                                else
                                {
                                    if (retVal != '') // use appending case
                                        retVal = String.format('{0}{1}', new List<String>{arabicAppendedGroup[group1], retVal});
                                    else
                                        retVal = String.format('{0}{1}', new List<String>{arabicGroup[group1], retVal}); // use normal case
                                }
                            }
                            else
                                retVal = String.format('{0}{1}', new List<String>{arabicGroup[group1], retVal}); // use normal case
                        }
                    }

                    retVal = String.format('{0}{1}', new List<String>{groupDescription, retVal});
                }

                group1++;
            }

            String formattedNumber = '';
            formattedNumber += (retVal != '') ? retVal : '';
            if ( intergerValue != 0)
            { // here we add arabcurrency name depending on  intergerValue : 1 ,2 , 3--->10 , 11--->99
                Integer remaining100 = (Integer)( Math.mod(intergerValue , 100));
                if (remaining100 == 0){
                    formattedNumber +=' ';
                    formattedNumber += arabcurrencyInfo.arabic1CurrencyName;
                }
                else
                    if (remaining100 == 1)
                        formattedNumber += arabcurrencyInfo.arabic1CurrencyName;
                    else
                        if (remaining100 == 2)
                        {
                            if ( intergerValue == 2)
                                formattedNumber += arabcurrencyInfo.arabic2CurrencyName;
                            else
                                formattedNumber += arabcurrencyInfo.arabic1CurrencyName;
                        }
                        else
                            if (remaining100 >= 3 && remaining100 <= 10)
                                formattedNumber += arabcurrencyInfo.arabic310CurrencyName;
                            else
                                if (remaining100 >= 11 && remaining100 <= 99)
                                    formattedNumber += arabcurrencyInfo.arabic1199CurrencyName;
            }
            formattedNumber += ( decimalValue != 0) ? ' و ' : '';
            formattedNumber += ( decimalValue != 0) ? decimalString : '';
            if ( decimalValue != 0)
            { // here we add arabcurrency part name depending on  intergerValue : 1 ,2 , 3--->10 , 11--->99
                formattedNumber += ' ';
                System.debug('formattedNumber : ' + formattedNumber);
                Integer remaining100 = (Integer)( Math.mod(decimalValue , 100));

                if (remaining100 == 0){
                    formattedNumber += arabcurrencyInfo.arabic1CurrencyPartName;
                }
                else
                    if (remaining100 == 1)
                        formattedNumber += arabcurrencyInfo.arabic1CurrencyPartName;
                    else
                        if (remaining100 == 2)
                            formattedNumber += arabcurrencyInfo.arabic2CurrencyPartName;
                        else
                            if (remaining100 >= 3 && remaining100 <= 10)
                                formattedNumber += arabcurrencyInfo.arabic310CurrencyPartName;
                            else
                                if (remaining100 >= 11 && remaining100 <= 99)
                                    formattedNumber += arabcurrencyInfo.arabic1199CurrencyPartName;
            }
                        formattedNumber += (arabicPrefixText != '') ? String.format('{0} ', new List<String>{arabicPrefixText}) : '';

            //formattedNumber += (arabicSuffixText != '') ? String.format('{0}', new List<String>{arabicSuffixText}) : '';
            formattedNumber += ' فقط ';
     system.debug('formattedNumber:......'+formattedNumber);
            return formattedNumber;

        }
    
       public static String convertToArabicTest(Decimal value, String arabcurrencyCode) {
   
            String englishTran = NumberToArabic.convertToEnglish(value,arabcurrencyCode);
            String finalOutput = GoogleTranslator.doTranslate(englishTran,'en','ar');
            System.debug('englishTran : ' + englishTran);
           System.debug('finalOutput : ' + finalOutput);
            String[] arrayEnglishTran = englishTran.split(' ');
            String finalArabicTran = '';
            List<String> listOfArabicString = new List<String>();
            for (String num : arrayEnglishTran) {
                if (num !=''){
                    if (englishOnes.contains(num)){
                        //finalArabicTran += ' ';
                        //finalArabicTran += arabicOnes[englishOnes.indexOf(num)];
                        listOfArabicString.add(arabicOnes[englishOnes.indexOf(num)]);
                    }
                    else if (englishTens.contains(num)){
                        //finalArabicTran += ' ';
                        //finalArabicTran += arabicTens[englishTens.indexOf(num)];
                        listOfArabicString.add(arabicTens[englishTens.indexOf(num)]);
                    }
                    else if (englishGroup1.contains(num)){
                        //finalArabicTran += ' ';
                        //finalArabicTran += arabicGroup[englishGroup1.indexOf(num)];
                        listOfArabicString.add(arabicGroup[englishGroup1.indexOf(num)]);
                    }
                    else if (num == 'UAE') {
                        //finalArabicTran += ' ';
                        //finalArabicTran += arabcurrencyInfo.arabic1CurrencyName;
                        listOfArabicString.add(arabcurrencyInfo.arabic1CurrencyName);
                    }
                    else if (num == 'and'){
                        //finalArabicTran += ' و ';
                        listOfArabicString.add('و');
                    }
                    else if (num == 'Fils'){
                        //finalArabicTran += arabcurrencyInfo.arabic1CurrencyPartName;
                        listOfArabicString.add(arabcurrencyInfo.arabic1CurrencyPartName);
                    }
                }
            }
            //finalArabicTran += ' فقط ';
            System.debug('finalArabicTran : ' + listOfArabicString);
           for (String currentItem :listOfArabicString){
               finalArabicTran += currentItem;
               finalArabicTran += ' ';
           }
           System.debug('finalArabicTran : ' + finalArabicTran);
            return finalArabicTran;
        }

    public static String processArabicGroup(Integer groupNumber, Integer groupLevel, Decimal remainingNumber) {
            Integer tens = Math.mod(groupNumber , 100);
        

            Integer hundreds = groupNumber / 100;
        
        system.debug('tens:'+tens  + 'hundreds'+ hundreds);

            String retVal = '';

            if (hundreds > 0) {
                if (tens == 0 && hundreds == 2) // حالة المضاف
                    retVal = String.format('{0}', new List<String>{arabicAppendedTwos[0]});
                else //  الحالة العادية
                    retVal = String.format('{0}', new List<String>{arabicHundreds[hundreds]});
            }
        
            if (tens > 0) {
                if (tens < 20) { // if we are processing under 20 numbers
                    if (tens == 2 && hundreds == 0 && groupLevel > 0) { // This is special case for number 2 when it comes alone in the group
                        if ( intergerValue == 2000 ||  intergerValue == 2000000 ||  intergerValue == 2000000000 ||  intergerValue == 2000000000000L ||  intergerValue == 2000000000000000L ||  intergerValue == 2000000000000000000L)
                            retVal = String.format('{0)', new List<String>{arabicAppendedTwos[groupLevel]}); // في حالة الاضافة
                        else
                            retVal = String.format('{0}', new List<String>{arabicTwos[groupLevel]});//  في حالة الافراد
                    }
                    else { // General case
                        if (retVal != '')
                            retVal += ' و ';

                        if (tens == 1 && groupLevel > 0 && hundreds == 0)
                            retVal += ' ';
                        else
                            if ((tens == 1 || tens == 2) && (groupLevel == 0 || groupLevel == -1) && hundreds == 0 && remainingNumber-0 == 0)
                                retVal += ''; // Special case for 1 and 2 numbers like: ليرة سورية و ليرتان سوريتان
                            else
                                retVal += getDigitFeminineStatus(tens, groupLevel);// Get Feminine status for this digit
                    }
                }
                else {
                    Integer ones = Math.mod(tens , 10);
                    tens = (tens / 10) - 2; // 20's offset

                    if (ones > 0) {
                        if (retVal != '')
                            retVal += ' و ';

                        // Get Feminine status for this digit
                        retVal += getDigitFeminineStatus(ones, groupLevel);
                    }

                    if (retVal != '')
                        retVal += ' و ';

                    // Get Tens text
                    retVal += arabicTens[tens];
                }
            }
             system.debug('retVal......'+retVal);
            return retVal;
    }       

        
        public static String getDigitFeminineStatus(Integer digit, Integer groupLevel) {
            if (groupLevel == -1) { // if it is in the decimal part
                if (arabcurrencyInfo.isCurrencyPartNameFeminine)
                    return arabicFeminineOnes[digit]; // use feminine field
                else
                    return arabicOnes[digit];
            }
            else
                if (groupLevel == 0) {
                    if (arabcurrencyInfo.isCurrencyNameFeminine)
                        return arabicFeminineOnes[digit];// use feminine field
                    else
                        return arabicOnes[digit];
                }
                else
                    return arabicOnes[digit];
        }
    public static String convertToEnglish(Decimal value, String arabcurrencyCode) {         
            NumberToArabic numberToArab= new NumberToArabic();
                        arabcurrencyInfo = new ArabCurrencyInfo('AED');
                //    arabcurrencyCode= 'AED';
                         system.debug('value..' + value);
         String v = String.valueOf(value).replace(',', '');
                          value= decimal.valueOf(v);
            finalNumber=value.setScale(arabcurrencyInfo.getPartPrecision(), System.roundingMode.HALF_DOWN);
            system.debug('convertToArabic decimalnumber'+finalNumber);
            numberToArabicConvert(value, sarabcurrency, englishPrefixText, englishSuffixText, arabicPrefixText, arabicSuffixText);
            

            return convertToEnglish();
        }
         public static String convertToEnglishMtr(Decimal value, String arabcurrencyCode) {         
            NumberToArabic numberToArab= new NumberToArabic();
                        arabcurrencyInfo = new ArabCurrencyInfo('AEDM');
                //    arabcurrencyCode= 'AED';
                         system.debug('value..' + value);
         String v = String.valueOf(value).replace(',', '');
                          value= decimal.valueOf(v);
            finalNumber=value.setScale(arabcurrencyInfo.getPartPrecision(), System.roundingMode.HALF_DOWN);
            system.debug('convertToArabic decimalnumber'+finalNumber);
            numberToArabicConvert(value, sarabcurrency, englishPrefixText, englishSuffixText, arabicPrefixText, arabicSuffixText);
            

            return convertToEnglish();
        }
        
        public static String convertToEnglish() {
                Decimal tempNumber = finalNumber;
        /*   if (tempNumber- (Integer)tempNumber == 0)
                return 'Zero';*/

            String decimalString = processGroup( decimalValue);

            String retVal = '';

            Integer decimalgroup = 0;

            if (tempNumber < 1)  {
                retVal = englishOnes[0];
                retVal += ' ';
            }
            else {
                while ((Long)tempNumber > 0) {
                    Integer numberToProcess = Math.mod((Integer)tempNumber,1000);
                    tempNumber = (tempNumber / 1000);

                    String groupDescription = processGroup(numberToProcess);

                    if (groupDescription != '') {
                        if (decimalgroup > 0) {
                            
                            retVal = String.format('{0}{1}',new List<String>{ englishGroup[decimalgroup], retVal});
                        }

                        retVal = String.format('{0} {1}',new List<String>{ groupDescription, retVal});
                    }

                    decimalgroup++;
                }
            }
                        String formattedNumber = '';

               
            formattedNumber += (englishPrefixText != '') ? String.format('{0} ', new List<String>{englishPrefixText}) : '';
            formattedNumber +=  '';
            formattedNumber += (retVal != '') ? retVal : '';
            formattedNumber +=  '';
            formattedNumber += (retVal != '') ? ( intergerValue == 1 ? ' '+arabcurrencyInfo.englishCurrencyName+' ' :' '+arabcurrencyInfo.englishPluralCurrencyName+'') : '';
            formattedNumber += (decimalString != '') ? ' and ' : '';
            formattedNumber += (decimalString != '') ? decimalString : '';
            formattedNumber += (decimalString != '') ? ' ' + ( decimalValue == 1 ? arabcurrencyInfo.englishCurrencyPartName : arabcurrencyInfo.englishPluralCurrencyPartName) : '';
            formattedNumber += (englishSuffixText != '') ? String.format(' {0}', new List<String>{ englishSuffixText}) : '';

             system.debug('formattedNumber English:::::::'+formattedNumber);
           
         
            return formattedNumber;
        }
        
        
        
    
   class ArabCurrencyInfo {
            String arabcurrencyID;
            String arabcurrencyCode;
            boolean isCurrencyNameFeminine;
            String englishCurrencyName;
            String englishPluralCurrencyName;
            String englishCurrencyPartName;
            String englishPluralCurrencyPartName;
            String arabic1CurrencyName;
            String arabic2CurrencyName;
            String arabic310CurrencyName;
            String arabic1199CurrencyName;
            String arabic1CurrencyPartName;
            String arabic2CurrencyPartName;
            String arabic310CurrencyPartName;
            String arabic1199CurrencyPartName;
            Integer partPrecision;
            boolean isCurrencyPartNameFeminine;
            
            public String getarabcurrencyID() {
                return arabcurrencyID;
            }

            public void setarabcurrencyID(String arabcurrencyID) {
                this.arabcurrencyID = arabcurrencyID;
            }

            public String getarabCurrencyCode() {
                return arabcurrencyCode;
            }

            public void setarabCurrencyCode(String arabcurrencyCode) {
                this.arabcurrencyCode = arabcurrencyCode;
            }

            public boolean isCurrencyNameFeminine() {
                return isCurrencyNameFeminine;
            }

            public void setCurrencyNameFeminine(boolean isCurrencyNameFeminine) {
                this.isCurrencyNameFeminine = isCurrencyNameFeminine;
            }

            public String getEnglishCurrencyName() {
                return englishCurrencyName;
            }

            public void setEnglishCurrencyName(String englishCurrencyName) {
                this.englishCurrencyName = englishCurrencyName;
            }

            public String getEnglishPluralCurrencyName() {
                return englishPluralCurrencyName;
            }

            public void setEnglishPluralCurrencyName(String englishPluralCurrencyName) {
                this.englishPluralCurrencyName = englishPluralCurrencyName;
            }

            public String getEnglishCurrencyPartName() {
                return englishCurrencyPartName;
            }

            public void setEnglishCurrencyPartName(String englishCurrencyPartName) {
                this.englishCurrencyPartName = englishCurrencyPartName;
            }

            public String getEnglishPluralCurrencyPartName() {
                return englishPluralCurrencyPartName;
            }

            public void setEnglishPluralCurrencyPartName(
                    String englishPluralCurrencyPartName) {
                this.englishPluralCurrencyPartName = englishPluralCurrencyPartName;
            }

            public String getArabic1CurrencyName() {
                return arabic1CurrencyName;
            }

            public void setArabic1CurrencyName(String arabic1CurrencyName) {
                this.arabic1CurrencyName = arabic1CurrencyName;
            }

            public String getArabic2CurrencyName() {
                return arabic2CurrencyName;
            }

            public void setArabic2CurrencyName(String arabic2CurrencyName) {
                this.arabic2CurrencyName = arabic2CurrencyName;
            }

            public String getArabic310CurrencyName() {
                return arabic310CurrencyName;
            }

            public void setArabic310CurrencyName(String arabic310CurrencyName) {
                this.arabic310CurrencyName = arabic310CurrencyName;
            }

            public String getArabic1199CurrencyName() {
                return arabic1199CurrencyName;
            }

            public void setArabic1199CurrencyName(String arabic1199CurrencyName) {
                this.arabic1199CurrencyName = arabic1199CurrencyName;
            }

            public String getArabic1CurrencyPartName() {
                return arabic1CurrencyPartName;
            }

            public void setArabic1CurrencyPartName(String arabic1CurrencyPartName) {
                this.arabic1CurrencyPartName = arabic1CurrencyPartName;
            }

            public String getArabic2CurrencyPartName() {
                return arabic2CurrencyPartName;
            }

            public void setArabic2CurrencyPartName(String arabic2CurrencyPartName) {
                this.arabic2CurrencyPartName = arabic2CurrencyPartName;
            }

            public String getArabic310CurrencyPartName() {
                return arabic310CurrencyPartName;
            }

            public void setArabic310CurrencyPartName(String arabic310CurrencyPartName) {
                this.arabic310CurrencyPartName = arabic310CurrencyPartName;
            }

            public String getArabic1199CurrencyPartName() {
                return arabic1199CurrencyPartName;
            }

            public void setArabic1199CurrencyPartName(String arabic1199CurrencyPartName) {
                this.arabic1199CurrencyPartName = arabic1199CurrencyPartName;
            }

            public Integer getPartPrecision() {
                return partPrecision;
            }

            public void setPartPrecision(Integer partPrecision) {
                this.partPrecision = partPrecision;
            }

            public boolean isCurrencyPartNameFeminine() {
                return isCurrencyPartNameFeminine;
            }

            public void setCurrencyPartNameFeminine(boolean isCurrencyPartNameFeminine) {
                this.isCurrencyPartNameFeminine = isCurrencyPartNameFeminine;
            }
        public ArabCurrencyInfo( String sarabcurrency) {
            if(sarabcurrency == 'AED')
            {
                system.debug('in AED');
              arabcurrencyID = sarabcurrency;
                                arabcurrencyCode = String.valueOf(sarabcurrency);
                                isCurrencyNameFeminine = false;
                                englishCurrencyName = 'UAE Dirham';
                                englishPluralCurrencyName = 'UAE Dirhams';
                                englishCurrencyPartName = 'Fils';
                                englishPluralCurrencyPartName = 'Fils';
                                arabic1CurrencyName = 'درهم إماراتي';
                                arabic2CurrencyName = 'درهم إماراتي';
                                arabic310CurrencyName = 'دراهم إماراتية';
                                arabic1199CurrencyName = 'درهماً إماراتياً';
                                arabic1CurrencyPartName = 'فلس';
                                arabic2CurrencyPartName = 'فلسان';
                                arabic310CurrencyPartName = 'فلوس';
                                arabic1199CurrencyPartName = 'فلساً';
                                partPrecision = 2;
                                isCurrencyPartNameFeminine = false;   
            }
            else if(sarabcurrency == 'JOD')
            {
                arabcurrencyCode = String.valueOf(sarabcurrency);
                                isCurrencyNameFeminine = false;
                                englishCurrencyName = 'Jordanian Dinar';
                                englishPluralCurrencyName = 'Jordanian Dinars';
                                englishCurrencyPartName = 'Fils';
                                englishPluralCurrencyPartName = 'Fils';
                                arabic1CurrencyName = 'دينار أردني';
                                arabic2CurrencyName = 'ديناران أردنيان';
                                arabic310CurrencyName = 'دنانير أردنية';
                                arabic1199CurrencyName = 'ديناراً أردنياً';
                                arabic1CurrencyPartName = 'فلس';
                                arabic2CurrencyPartName = 'فلسان';
                                arabic310CurrencyPartName = 'فلوس';
                                arabic1199CurrencyPartName = 'فلساً';
                                partPrecision = 3;
                                isCurrencyPartNameFeminine = false;
            }
            else if(sarabcurrency == 'BHD')
            {
              arabcurrencyID = sarabcurrency;
                                arabcurrencyCode = String.valueOf(sarabcurrency);
                                isCurrencyNameFeminine = false;
                                englishCurrencyName = 'Bahraini Dinar';
                                englishPluralCurrencyName = 'Bahraini Dinars';
                                englishCurrencyPartName = 'Fils';
                                englishPluralCurrencyPartName = 'Fils';
                                arabic1CurrencyName = 'دينار بحريني';
                                arabic2CurrencyName = 'ديناران بحرينيان';
                                arabic310CurrencyName = 'دنانير بحرينية';
                                arabic1199CurrencyName = 'ديناراً بحرينياً';
                                arabic1CurrencyPartName = 'فلس';
                                arabic2CurrencyPartName = 'فلسان';
                                arabic310CurrencyPartName = 'فلوس';
                                arabic1199CurrencyPartName = 'فلساً';
                                partPrecision = 3;
                                isCurrencyPartNameFeminine = false;  
            }
            else if(sarabcurrency == 'AEDM')
            {
                system.debug('in AEDM');
              arabcurrencyID = sarabcurrency;
                                arabcurrencyCode = String.valueOf(sarabcurrency);
                                isCurrencyNameFeminine = false;
                                englishCurrencyName = 'square meter';
                                englishPluralCurrencyName = 'Square Meters';
                                englishCurrencyPartName = 'Centimeter';
                                englishPluralCurrencyPartName = 'Centimeters';
                                arabic1CurrencyName = 'متر مربع';
                                arabic2CurrencyName = 'متر مربع ';
                                arabic310CurrencyName = 'متر مربع';
                                arabic1199CurrencyName = 'متر مربع';
                                arabic1CurrencyPartName = 'سنتيمتر';
                                arabic2CurrencyPartName = 'سنتيمتر';
                                arabic310CurrencyPartName = 'سنتيمتر';
                                arabic1199CurrencyPartName = 'سنتيمتر';
                                partPrecision = 2;
                                isCurrencyPartNameFeminine = false;   
            }
            }
        }
        

}