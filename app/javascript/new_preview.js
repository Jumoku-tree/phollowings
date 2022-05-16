function imgPreview() {
  const postForm = document.getElementById("new-work");
  const previewList = document.getElementById("img-previews");
  if (!postForm) return null;
// debugger


  const buildPreviewImg = (dataIndex, blob) => {
    console.log = dataIndex
    // プレビュー表示欄のdiv要素作成
    const previewWrapper = document.getElementById(`preview-0`);
    // プレビュー用の画像作成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'img-thumbnail');
    previewImage.setAttribute('id', 'preview-img-0');
    previewImage.setAttribute('src', blob);
    // 削除ボタン作成
    const deleteButton = document.createElement("button");
    deleteButton.setAttribute("class", "btn btn-sm btn-outline-secondary text-center mb-3");
    deleteButton.innerText = 'イラストを削除';
    const noImage = document.getElementById(`no-img0`);
    const imageButtonField = document.getElementById(`img-upload-0`)
    noImage.remove();
    
    deleteButton.addEventListener("click", () => deleteImage);

    // 作成したdivと画像用のHTML・削除ボタンを作成
    previewWrapper.appendChild(previewImage);
    imageButtonField.prepend(deleteButton);
    previewList.prepend(previewWrapper);

    function deleteImage() {
      const deletePreviewImage = document.getElementById("preview-img-0");
      deletePreviewImage.remove();
      const deleteFileField = document.getElementById("preview-0");
      deleteFileField.remove();
    }
  
  };


  const changedFileField = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    const file = e.target.files[0];
    if (!file) {
      deleteImage(dataIndex);
      return null;
    };
    const blob = window.URL.createObjectURL(file);

    // // data-indexを使用して、既にプレビューが表示されているかを確認する
    // const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    // if (alreadyPreview) {
    //   // クリックしたfile_fieldのdata-indexと、同じ番号のプレビュー画像が既に表示されている場合は、画像の差し替えのみを行う
    //   const alreadyPreviewImage = alreadyPreview.querySelector("img");
    //   alreadyPreviewImage.setAttribute("src", blob);
    //   return null;
    // };
    
    buildPreviewImg(dataIndex, blob);
  };

  const buildPreviewImg1 = (dataIndex, blob) => {
    console.log = dataIndex
    // プレビュー表示欄のdiv要素作成
    const previewWrapper = document.getElementById(`preview-1`);
    // プレビュー用の画像作成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'img-thumbnail');
    previewImage.setAttribute('id', 'preview-img-1');
    previewImage.setAttribute('src', blob);
    // 削除ボタン作成
    // const deleteButton = document.createElement("button");
    // deleteButton.setAttribute("class", "btn btn-sm btn-outline-secondary text-center mb-3");
    // deleteButton.innerText = 'イラストを削除';
    const noImage = document.getElementById(`no-img1`);
    const imageButtonField = document.getElementById(`img-upload-1`)
    noImage.remove();
    
    // deleteButton.addEventListener("click", () => deleteImage);

    // 作成したdivと画像用のHTML・削除ボタンを作成
    previewWrapper.appendChild(previewImage);
    imageButtonField.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);

    // function deleteImage() {
    //   const deletePreviewImage = document.getElementById("preview-img-1");
    //   deletePreviewImage.remove();
    //   const deleteFileField = document.getElementById("preview-1");
    //   deleteFileField.remove();
    // }
  
  };

  const changedFileField1 = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    const file1 = e.target.files[0];
    if (!file1) {
      deleteImage(dataIndex);
      return null;
    };
    const blob = window.URL.createObjectURL(file1);

    // // data-indexを使用して、既にプレビューが表示されているかを確認する
    // const alreadyPreview1 = document.querySelector(`.preview[data-index="${dataIndex1}"]`);
    // if (alreadyPreview1) {
    //   // クリックしたfile_fieldのdata-indexと、同じ番号のプレビュー画像が既に表示されている場合は、画像の差し替えのみを行う
    //   const alreadyPreviewImage1 = alreadyPreview1.querySelector("img");
    //   alreadyPreviewImage1.setAttribute("src", blob1);
    //   return null;
    // };
    
    buildPreviewImg1(dataIndex, blob);
  };

  const fileField = document.getElementById("upload-0");
  fileField.addEventListener('change', changedFileField);
  const fileField1 = document.getElementById("upload-1");
  fileField1.addEventListener('change', changedFileField1);


};

document.addEventListener('DOMContentLoaded', imgPreview);