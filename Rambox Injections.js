//Skype: Disable footer 
document.querySelector("div[style*='background-color: rgb(43, 44, 51); padding-left: 8px;']").style.display = "none";

//VK: Disable social junk
document.querySelector('#side_bar').style.display = "none";
//VK: Disable header bar
document.querySelector('#page_header_cont').style.display = "none";
document.querySelector('#page_body').style.marginTop = "0";
//VK: Disable old browser disclaimer
document.querySelector('#old_browser_wrap').style.display = "none";

//WhatsApp: Enter <=> Ctrl+Enter
document.addEventListener('keydown', function(e){
    if(e.keyCode === 13 && e.ctrlKey) {
        e.preventDefault();
        alert("You are Ctrl+Enter");
        retun;
    }
    if(e.keyCode === 13) {
        e.preventDefault();
        alert("You are Enter");
    }

});
