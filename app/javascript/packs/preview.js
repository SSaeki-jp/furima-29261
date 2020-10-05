// 商品出品か商品編集画面のみで動作するよう条件分岐
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {

  // HTMLが最初に読み込まれたときに起動する関数
  document.addEventListener('DOMContentLoaded', function(){

    // 画像表示用スペースを取得
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'item-img');
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){

      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img-upload img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      // 選択した画像を表示する関数
      createImageHTML(blob);
    });
  });
}
