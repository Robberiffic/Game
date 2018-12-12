/// @function string_split(keyinputs)
/// @description split a string based on a delimiter
/// @param {real} string
/// @param {real} delimiter

msg = argument0;
splitBy = argument1;

//var msg = "split,by,commas"; //string to split
//var splitBy = ","; //string to split the first string by
var slot = 0;
var splits; //array to hold all splits
var str2 = ""; //var to hold the current split we're working on building

var i;
for (i = 1; i < (string_length(msg)+1); i++) {
    var currStr = string_copy(msg, i, 1);
    if (currStr == splitBy) {
        splits[slot] = str2; //add this split to the array of all splits
        slot++;
        str2 = "";
    } else {
        str2 = str2 + currStr;
        splits[slot] = str2;
    }
}

return splits