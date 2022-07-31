public class MapListSetPractice {
    public void partA() {
        List<String> colorsList= new List<String>();
        colorsList.add('grey');
        colorsList.add('black');
        colorsList.add('blue');
        colorsList.add('white');
        colorsList.add('purple');
        system.debug('The color list is: '+ colorsList);
        system.debug('The number of element in color list is: '+ colorsList.size());
        system.debug('The color list contains red: '+ colorsList.contains('Red'));
        system.debug('The last element in color list is: '+ colorsList.get(colorsList.size()-1).toUpperCase());
        colorsList[4]= colorsList.get(4).toUpperCase();
        system.debug('The new color list is: '+ colorsList);
        List<String> colorsCode= new List<String>();
        colorsCode.add('GR001');
        colorsCode.add('BL002');
        colorsCode.add('BLK03');
        colorsCode.add('WH004');
        colorsCode.add('PR005');
        Boolean result= colorsList.equals(colorsCode);
        system.debug('The color code list is: ' + colorsCode);
        system.debug('The color and color code list are the same: ' + result);
        List<String> colorsAndCodes = new List<String>(colorsCode);
        colorsAndCodes.addAll(colorsList);
        system.debug('The color and color code list are : ' + colorsAndCodes);

    }

    public void partB(){
        Set<String> uniqueNameSet=new Set<String>{'Tom','Jerry'};
        system.debug('The numbers of element in the set is: '+uniqueNameSet.size());
        uniqueNameSet.add('Twity');
        system.debug('The unique name set is: '+uniqueNameSet);
        Boolean result=uniqueNameSet.contains('Busra');
        system.debug('Is the set contains my name: '+result);
        system.debug('Is the list empty? '+uniqueNameSet.isEmpty());
        uniqueNameSet.clear();
        system.debug('The set is: '+uniqueNameSet);
        system.debug('Is the list empty? '+uniqueNameSet.isEmpty());

    }

    public void partC(){
        Map<Integer,String> zipCodeToCityMap= new Map<Integer,String>();
        zipCodeToCityMap.put(100101 , 'New Delhi');
        zipCodeToCityMap.put(101234 , 'Istanbul');
        zipCodeToCityMap.put(569023 , 'New York City');
        zipCodeToCityMap.put(73008 , 'Oklahoma City');
        Boolean contains = zipCodeToCityMap.containsKey(204101);
        system.debug('Is the map contains mapping for 204101: '+contains);
        system.debug('all the Zip Codes present in the zipCodeToCityMap: '+zipCodeToCityMap.keySet());
        system.debug('all the city names present in the zipCodeToCityMap: '+zipCodeToCityMap.values());
        system.debug('the number of mappings present in the zipCodeToCityMap: '+zipCodeToCityMap.size());
        Set<Integer> uniqueZipCodeSet= new Set<Integer>(zipCodeToCityMap.keySet());
        system.debug('The unique set  is: '+ uniqueZipCodeSet);
        List<String> cityNameList= new List<String>(zipCodeToCityMap.values());
        system.debug('The unique list is: '+ cityNameList);
        system.debug('Is the map empty? '+zipCodeToCityMap.isEmpty());
    

    }
}