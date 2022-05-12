function imgPreview() {
  const postForm = document.getElementById("new-work");
  const previewList = document.getElementById("img-previews");
  if (!postForm) return null;
// debugger


  const buildPreviewImg = (dataIndex, blob) => {
    // プレビュー表示欄のdiv要素作成
    const previewWrapper = document.getElementById('preview-0');
    // プレビュー用の画像作成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'img-thumbnail');
    previewImage.setAttribute('src', blob);
    // 削除ボタン作成
    const deleteButton = document.createElement("button");
    deleteButton.setAttribute("class", "btn btn-sm btn-outline-secondary text-center");
    deleteButton.innerText = "1枚目のイラストを削除";
    const noImage = document.getElementById("no-img0");
    const imageButtonField = document.getElementById("img-upload-0")
    const imageButton = document.getElementById("upload-0");
    noImage.remove();
    imageButton.remove();

    deleteButton.addEventListener("click", () => deleteImage(dataIndex));

    // 作成したdivと画像用のHTML・削除ボタンを作成
    previewWrapper.appendChild(previewImage);
    imageButtonField.appendChild(deleteButton);
    previewList.prepend(previewWrapper);
  };

  const changedFileField = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    const file = e.target.files[0];
    if (!file) {
      deleteImage(dataIndex);
      return null;
    };
    const blob = window.URL.createObjectURL(file);

    // data-indexを使用して、既にプレビューが表示されているかを確認する
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    if (alreadyPreview) {
      // クリックしたfile_fieldのdata-indexと、同じ番号のプレビュー画像が既に表示されている場合は、画像の差し替えのみを行う
      const alreadyPreviewImage = alreadyPreview.querySelector("img");
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    };
    
    buildPreviewImg(dataIndex, blob);
  };

  const fileField = document.querySelector('input[type="file"][name="work_form[images][]"]');
  fileField.addEventListener('change', changedFileField);


};

document.addEventListener('DOMContentLoaded', imgPreview);