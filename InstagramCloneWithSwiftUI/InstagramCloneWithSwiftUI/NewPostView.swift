//
//  NewPostView.swift
//  InstagramCloneWithSwiftUI
//
//  Created by 김승원 on 7/6/24.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    // MARK: - Properties
    @State var caption = ""
    @Binding var tabIndex: Int
    @State var selectedItem: PhotosPickerItem?
    @State var postImage: Image?
    
    // MARK: - Functions
    func convertImage(item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return } // 컴이 이해할 수 있는 데이터로 변경
        guard let uiImage = UIImage(data: data) else { return } // UIImage형식으로 변경 (UIKit)
        self.postImage = Image(uiImage: uiImage)
    }
    
    var body: some View {
        VStack {
            // MARK: - Navigation Bar
            HStack{
                Button {
                    print("DEBUG: 뒤로가기")
                    tabIndex = 0
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                }
                
                Spacer()
                
                Text("새 게시물")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                // 텍스트 중앙에 맞추기 위함
                Image(systemName: "chevron.right")
                    .foregroundStyle(.clear)
            }
            .padding(.horizontal)
            
            // MARK: - image View
            PhotosPicker(selection: $selectedItem) { // 사진 선택 변수 (바인딩)
                if let image = self.postImage { // 사진 선택 후
                    image
                        .resizable()
//                        .aspectRatio(1, contentMode: .fit)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 400)
                        .clipped()
                } else { // 사진 선택 전
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding()
                        .tint(.black)
                }
            }
            // 변화 감지
            .onChange(of: selectedItem) { oldValue, newValue in // 변화가 일어날 변수 넣기 (@State)
                Task {
                    await convertImage(item: newValue)
                }
            }
            
            // MARK: - TextField
            TextField("문구를 작성하거나 설문을 추가하세요...", text: $caption)
                .padding()

            Spacer()
            
            // MARK: - 사진 공유 버튼
            Button {
                print("DEBUG: 사진 공유")
            } label: {
                Text("공유")
                    .frame(maxWidth: .infinity, maxHeight: 42)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}

#Preview {
    NewPostView(tabIndex: .constant(0))
}
