# SimpleSocialMedia 

SimpleSocialMedia — это приложение, написанное на UIKit полностью кодом с помощью AutoLayout. Приложение позволяет просматривать ленту постов в онлайн и офлайн режимах. На каждый пост можно поставить отметку "нравится" в любом из режимов. Лента постов обновляется жестом pull-to-refresh. 

## 📌 Основные особенности
- Архитектура: **MVVM**
- Используемые технологии: 
   - **Swift, UIKit, AutoLayout**
   - **Callbacks, Singletones, Generics, Boxing**
   - **Интерфейс: UITableView (UITableViewDataSource), UITableViewCell, UINavigationBar, UIRefreshControl, UIButton, UILabel, UIImageVie, UIView**
- Network: **Alamofire, Result<Success, Failure>**
- База данных: **CoreData**


## 📋 Краткое описание основных функций приложения
- На экране отображается лента постов, загруженных из сети. Они автоматически сохраняются в базу данных. 
- Если сеть отключить, то в ленте отобразятся посты, которые сохранены в базе данных. 
- На каждый пост можно поставить отметку "нравится". Вне зависимости от режима. При последующих открытиях приложения в онлайн и офлайн отметки "нравятся" синхронизированы. 
- Лента постов обновляется жестом pull-to-refresh. 

## 🎥 Записи экрана
[![Simulator_Screenshot_i_Phone_17_Pro_2025_11_22_at_20_31_28.png](https://i.postimg.cc/mZzMd6kH/Simulator_Screenshot_i_Phone_17_Pro_2025_11_22_at_20_31_28.png)](https://postimg.cc/9z2r0bGm)
[![Simulator_Screenshot_i_Phone_17_Pro_2025_11_22_at_20_31_46.png](https://i.postimg.cc/MZCBgbfM/Simulator_Screenshot_i_Phone_17_Pro_2025_11_22_at_20_31_46.png)](https://postimg.cc/XXgXC584)
[![Simulator_Screenshot_i_Phone_17_Pro_2025_11_22_at_20_31_58.png](https://i.postimg.cc/Kc6TCr3g/Simulator_Screenshot_i_Phone_17_Pro_2025_11_22_at_20_31_58.png)](https://postimg.cc/fkvk9dKw)

## 🌳 Структура проекта
```bash
SimpleSocialMedia/
├── App/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   └── Info.plist
├── PostList/
│   ├── PostListViewController.swift
│   └── PostListViewModel.swift
│   │     ├── PostCell/
│   │     │   ├── PostCell.swift
│   │     │   └── PostCellViewModel.swift
├── Models/
│   └── Post.swift
├── Services/
│   ├── NetworkManager.swift
│   └── StorageManeger.swift
├── Helpers/
│   └── Box.swift
├── Storyboard/
│   └── LaunchScreen.storyboard
├── Resources/
│   └── Assets.xcassets
└── SimpleSocialMedia.xcdatamodeld

Package Dependencies:
Alamofire

```

## ⚙️ Установка
Для запуска приложения вам потребуется:
1. Установленный Xcode.
2. Клонировать репозиторий:

   ```bash
   git clone https://github.com/mokhinsam/SimpleSocialMedia.git
    ```
3. Открыть проект в Xcode:
    ```bash
    cd SimpleSocialMedia
    open SimpleSocialMedia.xcodeproj
    ```
4. Запустить приложение на симуляторе или физическом устройстве.

## 📫 Контакты
Если у вас есть вопросы или предложения, вы можете связаться со мной по электронной почте: mokhinsam@gmail.com

