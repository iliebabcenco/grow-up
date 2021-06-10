const resBtn = document.querySelector('.resetarticlebtn')
const textArea = document.querySelector('.cke_editable_themed')
const textTitle = document.getElementById('article-title')

resBtn.onclick = () => {
    textTitle.value = ""
    textArea.innerHTML = ""
    
}